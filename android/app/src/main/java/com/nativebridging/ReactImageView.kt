package com.nativebridging

import com.facebook.drawee.backends.pipeline.Fresco
import com.facebook.drawee.view.SimpleDraweeView
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewProps
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.views.image.ImageResizeMode
import com.facebook.react.views.image.ReactImageView
import com.facebook.react.views.text.internal.span.CustomLineHeightSpan

class ReactImageView(
    private val callerContext: ReactApplicationContext
) : SimpleViewManager<ReactImageView>() {

    override fun createViewInstance(context: ThemedReactContext) =
        ReactImageView(context, Fresco.newDraweeControllerBuilder(), null, callerContext)

    override fun getName() = REACT_CLASS

    companion object {
        const val REACT_CLASS = "ReactImageView"
    }

    @ReactProp(name = "src")
    fun setSrc(view: ReactImageView, sources: ReadableArray?) {
        view.setSource(sources)
    }

    @ReactProp(name = "borderRadius", defaultFloat = 0f)
    override fun setBorderRadius(view: ReactImageView, borderRadius: Float) {
        view.setBorderRadius(borderRadius)
    }

    @ReactProp(name = ViewProps.RESIZE_MODE)
    fun setResizeMode(view: ReactImageView, resizeMode: String?) {
        view.setScaleType(ImageResizeMode.toScaleType(resizeMode))
    }

    @ReactProp(name = "height", defaultInt = 150)
    fun setHeight(view: ReactImageView, height: Int) {
        view.height
    }

    @ReactProp(name = "width", defaultInt = 150)
    fun setWidth(view: ReactImageView, width: Int) {
        view.width
    }
}