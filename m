Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769EE94D5
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 339F8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:36 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 729C7C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:34 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id n16so633314oig.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vF6n/fWi7qDhyIPBr9ynIj1J+PwzWmWvY/jqK94x778=;
 b=UnEehPImbDtyNv8SPTMJtIGpW2Nd/v0AqqWSEwVStDu8XfnrMZNkHzfb1fYSp/Vaob
 aGSuAEzqxlRDXmMobxv3vQ9BZhdhv8u4R+dxiGo+wNdgBWmVC8t0TWjkBeaHWp19K9vx
 f99xPFx3X69E53NHtLlNDPRvG4hqbD284kpwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vF6n/fWi7qDhyIPBr9ynIj1J+PwzWmWvY/jqK94x778=;
 b=dJKGogr50tYVhLeJR0BdvqD5jL1RJESjre2WUSt9UiJcgzeihuwvS8FpHoUHdXTl8c
 +t3DruPUgfyJ7McSV/q9iERRDPd+GU4NR2Pj2GT4vfwuG/rx/O/PXzsEIHEvfMnoGdLd
 vvgCrvpodNGKBpn9WGevBD6vBCH1Z6AMeQKiFyulXRdELxIi/QDoWZi499heGwbKWGat
 suZSVHxM2wOt11Swf76yrWoLjVhmX7Z5aBn/7BGQdmA8+h0/j+x5FI54Zv18mkQFQOk3
 4c4bX4rfC715kHFXryVLUlGXNbH0xv4hboSwzWpPRpFCH8YpGaLGw6NZr+EaHNdPcAXH
 YHKg==
X-Gm-Message-State: APjAAAX3l6VxFFpf38e7MzybenWrbIMOmfQbSOCXAz6hpVjZ4sCI6TTQ
 wLi1Azy1B6sOmcxRj0IHPy3AYkNnNotCN81XgCdNig==
X-Google-Smtp-Source: APXvYqxX99WsHYf1L09bQLD+7RUfec+8lZTH3ACtHqewOm9ssdUZh4SV6V8Oud6HOyAOFdCyofxBJLoLOTokItd9g4A=
X-Received: by 2002:aca:5b02:: with SMTP id p2mr6415579oib.94.1572400112780;
 Tue, 29 Oct 2019 18:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-14-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-14-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:19 -0600
Message-ID: <CAPnjgZ2bmZ=osRYbWcf3VT-z-eaSDQR8F4+qf3mUWn9Ni2PZjA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 13/13] test: pinmux: add pincontrol-gpio
	for pin configuration
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a simple pincontrol associated to the sandbox gpio driver,
> that allow to check pin configuration check with the
> command pinmux.
>
> The pinux test is also updated to test behavior with 2 pincontrols.
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
> a5        : gpio output drive-pull-push
> a6        : gpio output drive-pull-push
> ...
>
> Serie-cc: Heiko Schocher <hs@denx.de>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> ---
>
>  arch/sandbox/dts/test.dts    |  48 +++++----
>  drivers/gpio/sandbox.c       | 193 +++++++++++++++++++++++++++++++++++
>  test/py/tests/test_pinmux.py |  10 ++
>  3 files changed, 229 insertions(+), 22 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
