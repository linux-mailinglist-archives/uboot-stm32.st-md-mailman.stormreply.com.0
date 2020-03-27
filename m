Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FD195EEC
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 20:44:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BFDFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 19:44:29 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49A1CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 19:44:27 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v134so9826684oie.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UACmO7JFiXaiBP9be/DOBYFxkuZwojWSDvEVztxwmBI=;
 b=CXIwR7iIjZnaZBmkyogr/vaxz5v5lxn1TKM/4P/73U9h0P+UCemz/4FlpsOJOrN1ab
 XRbJbPAfAioX7dRQkHL/UQSs138wtdz5ZTvmgjgA+5h/zHOIeHfMEJsMKuxcvFNMF//k
 +sYBFGIN4ClysUGB2Ls94KxQeNj+sfu3xbfJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UACmO7JFiXaiBP9be/DOBYFxkuZwojWSDvEVztxwmBI=;
 b=UVqyVvHvUKU16fcyykOAdm0lTiES0+5NpdMzeCql891f1U/zgvFDAmB4I1GRvZV9ZG
 7XWnqqy4o+II5dYfmq0/W1K/RfkjrSf1YbIJ+5bEp+Ggh4knVPKrvW9H6zxyAZU8MNQA
 P1siDKRBvITWi9yucHDVZQosXEpBxn7ZicjNwjgu30+Dfq8Hbt6Z3XT0sK2LNmjDiXAx
 JjDd7ypMdlw7oWqJ4p1+Xd8+fhyjF/xBDepd0guRz4JteBGxOCtqZ1bbZ6p8nIJC7DHz
 FVeKYfAa6tm41LK79toOqKiEgx9FglG1SThSiiELfsniCwIYRms9MSeNNd3mE+UhhkOk
 Uzvw==
X-Gm-Message-State: ANhLgQ1k2llStSb3os3HtUn4Xkf/QxdoSmstYdmunjud64kQrFE9YknN
 zh3/FqQyzTU4K1wLZgVIRlf77j3ZOwGgD3kNzB+8iw==
X-Google-Smtp-Source: ADFU+vvDF7KIEscUu/S6YEjkPqS25RoFsKmT7ulUQPlYcZ2Yv7Qd0cTYVbGQm4oCuKcPWhrGI/0NiM2e1u4db4BEM+o=
X-Received: by 2002:aca:ab4b:: with SMTP id u72mr366295oie.97.1585338265533;
 Fri, 27 Mar 2020 12:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200327192102.GA26969@bill-the-cat>
In-Reply-To: <20200327192102.GA26969@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 27 Mar 2020 13:44:12 -0600
Message-ID: <CAPnjgZ0dSavGY44uyAWTJeL=x5RwRv4OkDJezzrJFb0Mg+a+xw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/21] dm: add support of new binding
	in gpio and pincontrol
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

Hi Tom,

On Fri, 27 Mar 2020 at 13:21, Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Jan 13, 2020 at 11:34:54AM +0100, Patrick Delaunay wrote:
>
> > Hi,
> >
> > it is the V3 of "dm: add support of new binding in gpio and pincontrol"
> > http://patchwork.ozlabs.org/project/uboot/list/?series=145044
> >
> > I rebase on v2020.01 and made some minor update after Simon Glass review.
> > And I also split the previous patch was part of v2 08/14 to help review
> >       http://patchwork.ozlabs.org/patch/1200865/
> >       "gpio: add ops for configuration with dir flags"
> >
> > I create this patchset to prepare alignment of stm32mp157c-ev1
> > device-tree with the linux kernel v5.4.
> >
> > One node for touch screen support use the IRQ line configuration
> > using the new kernel binding introduced by the linux kernel
> > commit ede033e1e863c from v5.1 ('dt-bindings:
> > gpio: document the new pull-up/pull-down flags')
> > https://github.com/torvalds/linux/commit/ede033e1e863c
> >
> > gt9147: goodix_ts@5d {
> >       compatible = "goodix,gt9147";
> >       reg = <0x5d>;
> >       status = "okay";
> >       irq-gpios = <&stmfx_pinctrl 14
> >                       (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> >       irq-flags = <IRQ_TYPE_EDGE_RISING>;
> > };
> >
> > In Linux Kernel, the GPIO configuration (pull down/up) are now
> > managed by GPIO lib but they are not yet supported by U-boot in
> > uclass GPIO or pincontrol (when used by gpio-hog).
> >
> > This serie adds the support of theses new defines (with ops
> > get_config/set_config) added in kernel GPIO binding and adds
> > the test in sandbox.
> >
> > NB: In a second phase, the removed set_open_drain/get_open_drain
> >     API could be replaced by the new ops get_config/set_config.
> >
> > I also align the gpio binding file with the version from the
> > latest kernel v5.3 (I don't think I remove any U-Boot specific
> > part with this patch)
> > I move the added information on gpio hog code in a new file
> > doc/README.gpio.
> >
> > To have functional test, I convert pinctrl-generic to
> > livetree otherwise the pins are not correctly configured in
> > sandbox, when CONFIG_OF_LIVE is activated.
> >
> > For the test on gpio I add information for pin configuration in
> > output of the command "pinmux status" with a simple pincontrol
> > driver associated to GPIO driver.
> >
> > NB: after rebase on master branch, the sandbox test "ut dm power_domain"
> >    is failing; it was not the case for v2019.10.
> >
> > ------------------------------------------------------ Captured stdout call -------------------------------------------------------
> > => ut dm power_domain
> > Test: dm_test_power_domain: power-domain.c
> > ../test/dm/test-main.c:72, dm_test_destroy(): 0 == uclass_destroy(uc): Expected 0x0 (0), got 0xffffffea (-22)
> > ../test/dm/test-main.c:107, dm_do_test(): 0 == dm_test_destroy(uts): Expected 0x0 (0), got 0x1 (1)
> > ../test/dm/test-main.c:169, dm_test_main(): 0 == dm_do_test(uts, test, 1): Expected 0x0 (0), got 0x1 (1)
> > =>
> >
> > I think it is linked to commit 52edfed65de9 ("dm: core:
> > device: switch off power domain after device removal")
> >
> > After some investigation :
> >
> > 1/ pincontrol is remove in uclass_destroy(0)
> >
> > 2/ power domain is removed in uclass_destroy(0)
> >
> > 3/ device_chld_unbind()
> > dev_power_domain_off
> > -> probe power domain (again)
> > --> pinctrl_select_state() in device_probe()
> > ---> pincontrol is probed (again)
> >
> > 4/ at the end of  dev_power_domain_off() function the power domain
> >    is unbind in dev_power_domain_off
> >    device_remove(pd.dev, DM_REMOVE_NORMAL);
> >
> > So power domain driver is correctly removed but it is not the
> > case for the pincontrol driver and that cause the issue.
> >
> > The problem occurs after my serie only because I introduce
> > a second pincontrol driver for sandbox, so the dynamic changes
> > but my serie is not the root cause of the issue.
> >
> > Workaround to allow test execution:
> >   "dm: core: device: don't probe pinctrl for power domain"
>
> Simon, any idea on how to fix the test failure above?  I don't think
> excluding the test is the right path forward.  Thanks!

Not really. I will see if I can figure it out when I get back to things.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
