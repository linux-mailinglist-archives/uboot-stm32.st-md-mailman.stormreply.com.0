Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE677400A65
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Sep 2021 10:31:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6A07C57B53;
	Sat,  4 Sep 2021 08:31:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B432C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Sep 2021 08:31:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id bt14so2792293ejb.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Sep 2021 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1SP+/c44F0YD8SaJ6xmPCXexZOflZlNX1q/k4yX/HvQ=;
 b=RSofzjm8pXmWkxl9+6ps0Rj6kgr5Wn8AB8tNvDnZLI7Xf1QGzq5lCkuSg9PNeOWiYS
 9CQGX4xcN8jQS/gzIybHOS1kzfQ/Uh6SEvJ2Y+d8ML/R9k0+Q3zNKiIKH0qpSycj6o27
 LrNDcrqAC26iRHMBgQlJeuhtEZ7fqp9D55r5bsQfu4wwrigctOhk0O6yMgyCPVy+d6TM
 kawyLLhVc+SxdBwLwcjlTCPtFrmyQeI166hqZwCtbc3NQ8RoS8ds71pvmYMB4ynNVMQm
 J5CkHwQ57JNy4NwyVHwhmROaRyYpFHdWs0gEBm72DURP7SgMR4gyKWfxWH6W39VTCQru
 ZUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1SP+/c44F0YD8SaJ6xmPCXexZOflZlNX1q/k4yX/HvQ=;
 b=eNdxHLCysg1oKhuBIvDTjvlLPo5xzKAIrMzZFbOEExHFbuoFvtjQbc9kpO0LNav7my
 UyN/gCystNOU5Hc8g0CMbSS0N29EEwHmbc05bWQHLQkbqb21rUUui/yb8vOUFEcaHHGW
 LWZB6HH83sgwgqhgKQ4H+AazQZz5SsOe+Iyw4PnRL9mrPel9fZpk/F5u/zIDVuam274z
 XiA1k57sSvRzZz+zu6sYgknzgEoYqJuZ5LndL6m/lC8R2CsSq2KBj+7EmyKzavqJvyxf
 m1ZIBqJOW6iC/HVRc3qI7X/cifr87W+gTEek6aRm7hLovauJ43fBpEB588cGvySq780W
 fpeg==
X-Gm-Message-State: AOAM533md5iZrr6XVPePQIXM3zqts3PAo9TTihx43VsMB7ovrFWxqsWy
 z46LnnC0LyVhAWf28+LE9s2x4VFwt2KyiIXMEwNvQw==
X-Google-Smtp-Source: ABdhPJwsFaLH2hf46G+HDuMOKaHVVI7z+OE/JwsSenXoljaSSQxFjFxrzx8w/YbW7SsOtiPHTsLAbRTEBODTCdtZXHs=
X-Received: by 2002:a17:906:3f95:: with SMTP id
 b21mr3072363ejj.368.1630744295654; 
 Sat, 04 Sep 2021 01:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <569089c3-8936-2a47-930e-218805064413@gmail.com>
In-Reply-To: <569089c3-8936-2a47-930e-218805064413@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sat, 4 Sep 2021 10:31:24 +0200
Message-ID: <CAN5uoS_-rCBtWdXe+_neH3iwnUOzdExX7OayUq3P+ufeohioPg@mail.gmail.com>
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Alex and Patrick,

(my apologies for my previous malformed post)


On Fri, 3 Sept 2021 at 18:43, Alex G. <mr.nuke.me@gmail.com> wrote:
>
> Hi Patrick
>
> On 9/2/21 4:56 AM, Patrick Delaunay wrote:
> > The configuration CONFIG_OPTEE is defined 2 times:
> > 1- in lib/optee/Kconfig for support of OPTEE images loaded by bootm command
> > 2- in drivers/tee/optee/Kconfig for support of OP-TEE driver.
> >
> > It is abnormal to have the same CONFIG define for 2 purpose;
> > and it is difficult to managed correctly their dependencies.

+1

> >
> > Moreover CONFIG_SPL_OPTEE is defined in common/spl/Kconfig
> > to manage OPTEE image load in SPL.
> >
> > This definition causes an issue with the macro CONFIG_IS_ENABLED(OPTEE)
> > to test the availability of the OP-TEE driver.
> >
> > This patch cleans the configuration dependency with:
> > - CONFIG_OPTEE_IMAGE (renamed) => support of OP-TEE image in U-Boot
> > - CONFIG_SPL_OPTEE_IMAGE (renamed) => support of OP-TEE image in SPL
> > - CONFIG_OPTEE (same) => support of OP-TEE driver in U-Boot
> > - CONFIG_OPTEE_LIB (new) => support of OP-TEE library
> >
> > After this patch, the macro have the correct behavior:
> > - CONFIG_IS_ENABLED(OPTEE_IMAGE) => Load of OP-TEE image is supported
> > - CONFIG_IS_ENABLED(OPTEE) => OP-TEE driver is supported
>
> It seems a little odd to have both OPTEE_LIB and OPTEE_IMAGE, since they
> are both used together to support booting with OP-TEE. What also seems
> odd is that "OP-TEE driver in U-Boot" does not depend on "OP-TEE library".
>
> Introducing OPTEE_LIB then, makes sense to me, provided that OPTEE
> depends on OPTEE_LIB, but I'm not sure about OPTEE_IMAGE.
>
> > diff --git a/lib/optee/optee.c b/lib/optee/optee.c
> > index 672690dc53..5676785cb5 100644
> > --- a/lib/optee/optee.c
> > +++ b/lib/optee/optee.c
> > @@ -20,6 +20,7 @@
> >       "\n\theader lo=0x%08x hi=0x%08x size=0x%08lx arch=0x%08x" \
> >       "\n\tuimage params 0x%08lx-0x%08lx\n"
> >
> > +#if defined(CONFIG_OPTEE_IMAGE)
> >   int optee_verify_image(struct optee_header *hdr, unsigned long tzdram_start,
> >                      unsigned long tzdram_len, unsigned long image_len)
> >   {
> > @@ -70,6 +71,7 @@ error:
> >
> >       return ret;
> >   }
> > +#endif
>
> One the idea of having CONFIGs is to include/exclude code via
> obj-$(CONFIG_FOO)+=code.c. This prevents the proliferation of #ifdefs.
> It's fairly counterintuitive to have a CONFIG_OPTEE_IMAGE in a file
> controlled by CONFIG_OPTEE_LIB.
>
> Going to optee_verify_image() itself. It essentially checks against
> OPTEE_TZDRAM_(BASE/SIZE). But those are a derived from devicetree, not
> Kconfig. So it seems the motivation behing optee_verify_bootm_image() is
> flawed. Also the error message is not very helpful.

The 2 functions are related to CONFIG_BOOTM_OPTEE. They could depend on.
My 2 cents.
If preserving the optee_verify_xxx() functions, they could move to a
specific source lib/optee/optee_image.c

>
> In fact, the SPL boot path for OP-TEE doesn't use this function. That's
> intentional.
>
> Here's what I suggest:
>    - Remove OPTEE_TZDRAM_BASE and _SIZE

There is some legacy here, board/warp7and board/technexion/pico-imx7d.

regards,
etienne

>
>    - Remove optee_verify_bootm_image()
>
>    - No need for CONFIG_OPTEE_IMAGE
>
>
>
> Alex
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
