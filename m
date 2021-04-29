Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3E36EDE3
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90EE4C58D59;
	Thu, 29 Apr 2021 16:10:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FC99C57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:10:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t18so9907592wry.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CoLROV0TwvvbgaEa2VpSQCWyhdULiL5V7g1SVA/nMjw=;
 b=g/v1TLna+B7RBWN1Wl4V8Pb3KfatxiXBoTJHjKFYKo6dwJThMtIvRGrqVsowfw1lgg
 ugPSXPqQuepmlyco54rkWi5n+bJGITQXXvO+iu7rz+qzTb1e8ZNRONiK+1H8VJxWNskd
 5M0dSbUxz8cSZjO4KgN52b4/GNG9r9S6QhEs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CoLROV0TwvvbgaEa2VpSQCWyhdULiL5V7g1SVA/nMjw=;
 b=dQDBzIuMRbCOXxwb/eKgZ23mxBmRQqv/ul2zPtO47WU13TqReJc3RvLvHiPpFQo4CL
 PHnpGIpZXzeUYDxdgZYBFi/Dt7BINXa8xsAvg52E43jtNoOyjkREcakQaSglQJb6Xo7n
 uXtHXsbOS4zUbKHY9czAULaFLuIOAWXwxFzFBGS+VpJmGOzNfvzqQpkG51oRdMZyVQwN
 CBYU5c/pD5gZ9aELE9LFdyEPQK3P/95+dXKXXmEOfdV/PX4eSVoEB3qKm3ydzZM5ucLR
 E1xROtPHBWxB4YNdhygcCAOkXKH90LxNuMT/E1rWCvoNAYvb+7dKhefi+DpK3+yfXkJ6
 SFHA==
X-Gm-Message-State: AOAM532FfHvyTZAuvA+cVJohzclri3WCo8uwuDUJ9zjL1YLg/ln8HJwp
 +1kUfF84LnWbGUOYwuCiNuMDdDfKxXQvC79Wpqdfhg==
X-Google-Smtp-Source: ABdhPJw76jZcSy7NBBe/fHlp+meacQHPzsDlCw2c2PdUpm3VlvqKII/TM4m0AjzcjCe+yD8QgM41zy6upwi+AYJXEiw=
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr650327wrs.204.1619712622419;
 Thu, 29 Apr 2021 09:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <PA4PR10MB4399E6FCFA94A7F85ED8866083489@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PA4PR10MB4399E6FCFA94A7F85ED8866083489@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:08 -0700
Message-ID: <CAPnjgZ3Ys0SyPFYakq-UN31csKwz0skfGCknfm3OKg+rLqVxzA@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of
	do_status
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

Hi Patrick,

On Tue, 20 Apr 2021 at 03:21, Patrice CHOTARD <patrice.chotard@st.com> wrote:
>
> Hi Patrick
>
> -----Original Message-----
> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On Behalf Of Patrick DELAUNAY
> Sent: mercredi 28 octobre 2020 11:07
> To: u-boot@lists.denx.de
> Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Simon Glass <sjg@chromium.org>; Patrick DELAUNAY <patrick.delaunay@st.com>; Sean Anderson <seanga2@gmail.com>
> Subject: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of do_status
>
> Update the result of do_status and alway returns a CMD_RET_ value (-ENOSYS was a possible result of show_pinmux).
>
> This patch also adds pincontrol name in error messages (dev->name) and treats correctly the status sub command when pin-controller device is not selected.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/pinmux.c                 | 44 +++++++++++++++++++-----------------
>  test/py/tests/test_pinmux.py |  4 ++--
>  2 files changed, 25 insertions(+), 23 deletions(-)
>
> diff --git a/cmd/pinmux.c b/cmd/pinmux.c index 9942b15419..af04c95a46 100644
> --- a/cmd/pinmux.c
> +++ b/cmd/pinmux.c
> @@ -41,7 +41,7 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
>         return CMD_RET_SUCCESS;
>  }
>
> -static int show_pinmux(struct udevice *dev)

I think it is better to return the error code and let the caller
ignore it, If we later want to report the error code, we can.

> +static void show_pinmux(struct udevice *dev)
>  {
>         char pin_name[PINNAME_SIZE];
>         char pin_mux[PINMUX_SIZE];
> @@ -51,54 +51,56 @@ static int show_pinmux(struct udevice *dev)
>
>         pins_count = pinctrl_get_pins_count(dev);
>
> -       if (pins_count == -ENOSYS) {
> -               printf("Ops get_pins_count not supported\n");
> -               return pins_count;
> +       if (pins_count < 0) {

Why change this to < 0 ?

I believe that -ENOSYS is the only valid error. We should update the
get_pins_count() API function to indicate that.

> +               printf("Ops get_pins_count not supported by %s\n", dev->name);
> +               return;
>         }
>
>         for (i = 0; i < pins_count; i++) {
>                 ret = pinctrl_get_pin_name(dev, i, pin_name, PINNAME_SIZE);
> -               if (ret == -ENOSYS) {
> -                       printf("Ops get_pin_name not supported\n");
> -                       return ret;
> +               if (ret) {
> +                       printf("Ops get_pin_name error (%d) by %s\n",
> +                              ret, dev->name);
> +                       return;
>                 }
>
>                 ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
>                 if (ret) {
> -                       printf("Ops get_pin_muxing error (%d)\n", ret);
> -                       return ret;
> +                       printf("Ops get_pin_muxing error (%d) by %s in %s\n",
> +                              ret, pin_name, dev->name);
> +                       return;
>                 }
>
>                 printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
>                        PINMUX_SIZE, pin_mux);
>         }
> -
> -       return 0;
>  }
>
>  static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
>                      char *const argv[])
>  {
>         struct udevice *dev;
> -       int ret = CMD_RET_USAGE;
>
> -       if (currdev && (argc < 2 || strcmp(argv[1], "-a")))
> -               return show_pinmux(currdev);
> +       if (argc < 2) {
> +               if (!currdev) {
> +                       printf("pin-controller device not selected\n");
> +                       return CMD_RET_FAILURE;
> +               }
> +               show_pinmux(currdev);
> +               return CMD_RET_SUCCESS;
> +       }
>
> -       if (argc < 2 || strcmp(argv[1], "-a"))
> -               return ret;
> +       if (strcmp(argv[1], "-a"))
> +               return CMD_RET_USAGE;
>
>         uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
>                 /* insert a separator between each pin-controller display */
>                 printf("--------------------------\n");
>                 printf("%s:\n", dev->name);
> -               ret = show_pinmux(dev);
> -               if (ret < 0)
> -                       printf("Can't display pin muxing for %s\n",
> -                              dev->name);
> +               show_pinmux(dev);
>         }
>
> -       return ret;
> +       return CMD_RET_SUCCESS;
>  }
>
>  static int do_list(struct cmd_tbl *cmdtp, int flag, int argc, diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py index 0cbbae000c..b3ae2ab024 100644
> --- a/test/py/tests/test_pinmux.py
> +++ b/test/py/tests/test_pinmux.py
> @@ -13,9 +13,9 @@ def test_pinmux_usage_1(u_boot_console):
>  @pytest.mark.buildconfigspec('cmd_pinmux')
>  def test_pinmux_usage_2(u_boot_console):
>      """Test that 'pinmux status' executed without previous "pinmux dev"
> -    command displays pinmux usage."""
> +    command displays error message."""
>      output = u_boot_console.run_command('pinmux status')
> -    assert 'Usage:' in output
> +    assert 'pin-controller device not selected' in output
>
>  @pytest.mark.buildconfigspec('cmd_pinmux')
>  @pytest.mark.boardspec('sandbox')
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Thanks
> Patrice

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
