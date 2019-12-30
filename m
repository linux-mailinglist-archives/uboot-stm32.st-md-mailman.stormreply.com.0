Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6B12CB96
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F547C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:35 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B756C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:34 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b18so22520910otp.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91LNd/yLYEOtbndMA1fKNaQ8506CvF44KXPzPDulj4I=;
 b=K0gLohP7d7rMLqoN16WDHuQGdEsYsYQMWGS5jzmqi6YsR1viOz9zZtJMcZOlqR7X14
 5A6+UhmbnRHuxHbbVQJU7AHgKr/Clmy7bIdZGnlk3AL3/NSJmua6fauNtsCMveXPlDYF
 jorQ5YtWdGjR48Nk77b0MQs+SeOj2l5G+scY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91LNd/yLYEOtbndMA1fKNaQ8506CvF44KXPzPDulj4I=;
 b=Mpd2Iot8n8EhDeF/TIQjVpcSB3wnXoVeGz8268bG3H+ugA4zAwVZNrgcBJmOGMz3+h
 VKiVMO7gW6V3JC2rd4ppA2CskocFHqKaDhCSRwr1Fl+Bv4xcaVrzlqzdvw2AhQfmGezR
 UDl2jnIYd3BJxq1W7f1NUSSe2V1EoWaKCUQJrP941HWJqw/3Ixv+2qKspP9Y53Gqi9y3
 6IcgEufmrWKh65u/SOSXETIsZU4QT0m1vjDk3Ia97CD7tl91VyWwdRcHrvWezutFCNDw
 I3UfgaR6i0AaTcaxCu5+d5kL8mA54vOMuK+5N4f47KS/ek/5HOxZZN2mqYETlLod4M3B
 7AXA==
X-Gm-Message-State: APjAAAUUsr91O3u+P7YlzLgEQDTMtN6iPu0YVgaffFiRNh3O2IVdyVuj
 Mn33Bz2eWNtiWph4ZJ2R0NygAM48huW8i8SAJi2enA==
X-Google-Smtp-Source: APXvYqx1Y9YY6JuQMx8OsmviqU/cl3mTZeGvxMLGvNUFGb/hxC3crX2L8X1rIHVQxGym4LjO1lMpzTjh07PF57tx/YQ=
X-Received: by 2002:a9d:2c68:: with SMTP id f95mr72487274otb.33.1577668892624; 
 Sun, 29 Dec 2019 17:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-15-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-15-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:18 -0700
Message-ID: <CAPnjgZ2NNfwvxkY7jx9gWU0cWRDX_QMrYYrUCsdmf61pw_RHeA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 14/14] test: pinmux: add
	pincontrol-gpio for pin configuration
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a simple pincontrol associated to the sandbox gpio driver,
> that allows to check pin configuration with the command pinmux.
>
> The pmux test is also updated to test behavior with 2 pincontrols.
>
> Example to check LED pin configuration:
>
> => pinmux list
> | Device                        | Driver                        | Parent
> | pinctrl-gpio                  | sandbox_pinctrl_gpio          | root_driver
> | pinctrl                       | sandbox_pinctrl               | root_driver
>
> => pinmux dev pinctrl-gpio
>
> => pinmux status
>
> a0        : gpio input .
> a1        : gpio input .
> a2        : gpio input .
> a3        : gpio input .
> a4        : gpio input .
> a5        : gpio output .
> a6        : gpio output .
> ...
>
> Serie-cc: Heiko Schocher <hs@denx.de>
> Serie-cc: Simon Glass <sjg@chromium.org>

Series-cc :-)

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> ---
>
> Changes in v2:
> - Adapt sandbox_pinctrl_gpio driver with the saved dir_flags in
>   sandbox gpio driver
> - rebase on v2020.01-rc3
>
>  arch/sandbox/dts/test.dts    |  48 +++++----
>  drivers/gpio/sandbox.c       | 195 +++++++++++++++++++++++++++++++++++
>  test/py/tests/test_pinmux.py |  10 ++
>  3 files changed, 231 insertions(+), 22 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
