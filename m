Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D638436EDE4
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:10:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C34CC58D5A;
	Thu, 29 Apr 2021 16:10:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83CBEC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:10:26 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h15so15243708wre.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WIm9ODd52QNJP8uUTlDUyKPPXZPkbXWIxojLx1eA9Ro=;
 b=GkxJ+D1VqW14T7FkQ0ZVdxiR8BY4l/g05CrKudjQxcdUn7QY7dGzbHyz2TidHqA0tm
 Bs/9xD1PEegYB8xptGYGSHeINOiikukbmJt47rnEtmxiV0r+pSf9dANuo5hwzE30VdwU
 da3eDTuixHwRLOOZ+S6zVgc+f8FV/bVktOPBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WIm9ODd52QNJP8uUTlDUyKPPXZPkbXWIxojLx1eA9Ro=;
 b=jRs9OSaf8YSO5YyJYvxcYEmM+cyotk3rimRUBBMLr3PqWebX18WHMBGnTummHO8HkO
 8Q63HfQuv6+d6wIXsu+Dl2qX+fo9C0ijGLoW9CdmzzmGJY8bkw8LmTRfLQH9bPahT+wb
 rMl3oLGbFCkWx6c/J67ph8ckJQCSIUVfGJh67/SawnB0cfBqv2MsFipu4sM3tPIRo9mt
 zLiJayjUWqNbm+JIav6KwICW8WdRAAayH/63jIpuA3OUWjLDr1F7ByiNHYOfU9GVBHo+
 FhmkDM2g1UshlRMu+gbtIGHukF8cG8mZCvfIW5S5jnDFxa9DLLOXQA01Shlw7fCxs8rE
 yghw==
X-Gm-Message-State: AOAM5329z03hLNM08D8ozBSE5gHLvffIKH3Nky3YeshT6g00EMAyqGei
 8boA7Il5cx0XAqpNj7QEplFf7BYzNimYtOKogu7p1w==
X-Google-Smtp-Source: ABdhPJw12NqvaFWjveVSCejO2kud6LxvJTjdXE30FomRHp359bTLmnsViIibfTabfL0bkLZQhHVbHZiaqUISYvptAig=
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr684204wrb.56.1619712625819;
 Thu, 29 Apr 2021 09:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <20201028100640.13876-2-patrick.delaunay@st.com>
In-Reply-To: <20201028100640.13876-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:12 -0700
Message-ID: <CAPnjgZ1wjs6t7G=oYArzc9j7P-KHg4BsVeLcmRzn2mogeEP05g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in
	status command
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

On Wed, 28 Oct 2020 at 03:06, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Allow pin name parameter for pimux staus command,
> as gpio command to get status of one pin.
>
> The possible usage of the command is:
>
> > pinmux dev pinctrl
> > pinmux status
>
> > pinmux status -a
>
> > pinmux status <pin-name>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/pinmux.c                 | 41 +++++++++++++++++++++++++-----------
>  test/py/tests/test_pinmux.py | 29 +++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 12 deletions(-)
>
> diff --git a/cmd/pinmux.c b/cmd/pinmux.c
> index af04c95a46..e096f16982 100644
> --- a/cmd/pinmux.c
> +++ b/cmd/pinmux.c
> @@ -41,19 +41,20 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
>         return CMD_RET_SUCCESS;
>  }
>
> -static void show_pinmux(struct udevice *dev)
> +static bool show_pinmux(struct udevice *dev, char *name)

How about returning -ENOENT if there is no pin.

>  {
>         char pin_name[PINNAME_SIZE];
>         char pin_mux[PINMUX_SIZE];
>         int pins_count;
>         int i;
>         int ret;
> +       bool found = false;
>
>         pins_count = pinctrl_get_pins_count(dev);
>
>         if (pins_count < 0) {
>                 printf("Ops get_pins_count not supported by %s\n", dev->name);
> -               return;
> +               return found;

Here found will be false, so I think you are conflating different
errors. Better to return pins_count in this case.

>         }
>
>         for (i = 0; i < pins_count; i++) {
> @@ -61,43 +62,59 @@ static void show_pinmux(struct udevice *dev)
>                 if (ret) {
>                         printf("Ops get_pin_name error (%d) by %s\n",
>                                ret, dev->name);
> -                       return;
> +                       return found;
>                 }
> -
> +               if (name && strcmp(name, pin_name))
> +                       continue;
> +               found = true;
>                 ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
>                 if (ret) {
>                         printf("Ops get_pin_muxing error (%d) by %s in %s\n",
>                                ret, pin_name, dev->name);
> -                       return;
> +                       return found;
>                 }
>
>                 printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
>                        PINMUX_SIZE, pin_mux);
>         }
> +
> +       return found;
>  }
>
>  static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
>                      char *const argv[])
>  {
>         struct udevice *dev;
> +       char *name;
> +       bool found = false;
>
>         if (argc < 2) {
>                 if (!currdev) {
>                         printf("pin-controller device not selected\n");
>                         return CMD_RET_FAILURE;
>                 }
> -               show_pinmux(currdev);
> +               show_pinmux(currdev, NULL);
>                 return CMD_RET_SUCCESS;
>         }
>
>         if (strcmp(argv[1], "-a"))
> -               return CMD_RET_USAGE;
> +               name = argv[1];
> +       else
> +               name = NULL;
>
>         uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
> -               /* insert a separator between each pin-controller display */
> -               printf("--------------------------\n");
> -               printf("%s:\n", dev->name);
> -               show_pinmux(dev);
> +               if (!name) {
> +                       /* insert a separator between each pin-controller display */
> +                       printf("--------------------------\n");
> +                       printf("%s:\n", dev->name);
> +               }
> +               if (show_pinmux(dev, name))
> +                       found = true;
> +       }
> +
> +       if (name && !found) {
> +               printf("%s not found\n", name);
> +               return CMD_RET_FAILURE;
>         }
>
>         return CMD_RET_SUCCESS;
> @@ -148,5 +165,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
>            "show pin-controller muxing",
>            "list                     - list UCLASS_PINCTRL devices\n"
>            "pinmux dev [pincontroller-name] - select pin-controller device\n"
> -          "pinmux status [-a]              - print pin-controller muxing [for all]\n"
> +          "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
>  )
> diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
> index b3ae2ab024..fbde1d99b1 100644
> --- a/test/py/tests/test_pinmux.py
> +++ b/test/py/tests/test_pinmux.py
> @@ -82,3 +82,32 @@ def test_pinmux_status(u_boot_console):
>      assert ('P6        : GPIO1 drive-open-drain.' in output)
>      assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
>      assert ('P8        : GPIO3 bias-disable.' in output)
> +
> +@pytest.mark.buildconfigspec('cmd_pinmux')
> +@pytest.mark.boardspec('sandbox')
> +def test_pinmux_status_pinname(u_boot_console):
> +    """Test that 'pinmux status <pinname>' displays selected pin."""
> +
> +    output = u_boot_console.run_command('pinmux status a5')
> +    assert ('a5        : gpio output .' in output)
> +    assert (not 'pinctrl-gpio:' in output)
> +    assert (not 'pinctrl:' in output)
> +    assert (not 'a6' in output)
> +    assert (not 'P0' in output)
> +    assert (not 'P8' in output)
> +
> +    output = u_boot_console.run_command('pinmux status P7')
> +    assert (not 'pinctrl-gpio:' in output)
> +    assert (not 'pinctrl:' in output)
> +    assert (not 'a5' in output)
> +    assert (not 'P0' in output)
> +    assert (not 'P6' in output)
> +    assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
> +    assert (not 'P8' in output)
> +
> +    output = u_boot_console.run_command('pinmux status P9')
> +    assert (not 'pinctrl-gpio:' in output)
> +    assert (not 'pinctrl:' in output)
> +    assert (not 'a5' in output)
> +    assert (not 'P8' in output)
> +    assert ('P9 not found' in output)

Can we write this test in C? We can use run_command()...see acpi.c

> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
