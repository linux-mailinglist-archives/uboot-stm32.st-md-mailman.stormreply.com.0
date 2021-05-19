Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B23892B9
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 May 2021 17:34:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1505AC57B60;
	Wed, 19 May 2021 15:34:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0548C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 15:34:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i17so14464847wrq.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 08:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+PDFqsOxQwWohcGyKe2dMc/jPzoPIhia6KISKv3WhI=;
 b=QLxZ/7NLVVfGsOdPLFEnuFFuvRB5+iyaV0GY9AE/DW0iv9FnjB0mIRlHBEla6jRZYH
 7TtUWydmVYM0tUks5Uj8vcv2rQc4UgJHVKE2YGjmH7fYxXhFZbwfSWLq4Js5/KyXUOAH
 wpmei89XKRQxy+pl3LmTBwxmyOItnPuf/vnms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+PDFqsOxQwWohcGyKe2dMc/jPzoPIhia6KISKv3WhI=;
 b=dKE6Nje4gm7q3RkYz0rGYD44ref1SnfYQvAU2YCy1C3glQMPlvq4U/9wo68pOZ7QH0
 9999t75NcglvAOUSfg+EW6+lZz/PpQzBia0fWVBLNobK+4nvF7jDwBABejuKKwmXE2oL
 FuC2hue7GcJxNd0J9866YkF4N9J/+BJF2iKKh4+Fv04qDI2kZHDgbAZ1CKqRVGfO8xix
 asEmiyIFErUBkVSasiYg44sLa1AjC5qxeSmSuCSsr2xs7fLnJN/e3rmKD69l0YR8yqcP
 jx/6/Vrw64hejkxPuka9E0dpzuKMRs49UWdCziJdyhw7buZmHeSbAfa77i0GV1KxGMXI
 KFSw==
X-Gm-Message-State: AOAM530froOOCdXUUB4d9whspKDsPNpPawfYZCn8XHxVhvaYkBK7XuUI
 2qSGOn1tTamuAyVuovpXcBZ9cos+u2iD83E9GBVLNw==
X-Google-Smtp-Source: ABdhPJyPwvd6CjE0nahJU8zAt6rmDIQd3YoRTCj68TcAmmGxwnmWPW5hsznKiAHERYp6hnxpLWpKVhRX4jI5PDgbDjs=
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr15868689wri.66.1621438457920; 
 Wed, 19 May 2021 08:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142916.v2.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
 <20210519142916.v2.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid>
In-Reply-To: <20210519142916.v2.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 19 May 2021 09:34:02 -0600
Message-ID: <CAPnjgZ0APSOr10G+nFZB+62QBC+-B=jtExVi5Au-_EJYHESgtw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Priyanka Jain <priyanka.jain@nxp.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] cmd: pinmux: support pin name in
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

On Wed, 19 May 2021 at 06:30, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
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
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - use -ENOENT when the pin name is not found
> - move the added pytests in a C file cmd/pinmux.c
>
>  cmd/pinmux.c      | 38 +++++++++++++++++++++++++++++---------
>  test/cmd/Makefile |  1 +
>  test/cmd/pinmux.c | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 9 deletions(-)
>  create mode 100644 test/cmd/pinmux.c

Reviewed-by: Simon Glass <sjg@chromium.org>

nit below

>
> diff --git a/cmd/pinmux.c b/cmd/pinmux.c
> index 0df78c71da..527d33d562 100644
> --- a/cmd/pinmux.c
> +++ b/cmd/pinmux.c
> @@ -41,13 +41,14 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
>         return CMD_RET_SUCCESS;
>  }
>
> -static int show_pinmux(struct udevice *dev)
> +static int show_pinmux(struct udevice *dev, char *name)

Can you add a comment indicating what these args are (and that @name
can be NULL) and return values?

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
> @@ -62,7 +63,9 @@ static int show_pinmux(struct udevice *dev)
>                         printf("Ops get_pin_name error (%d) by %s\n", ret, dev->name);
>                         return ret;
>                 }
> -
> +               if (name && strcmp(name, pin_name))
> +                       continue;
> +               found = true;
>                 ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
>                 if (ret) {
>                         printf("Ops get_pin_muxing error (%d) by %s in %s\n",
> @@ -74,6 +77,9 @@ static int show_pinmux(struct udevice *dev)
>                        PINMUX_SIZE, pin_mux);
>         }
>
> +       if (!found)
> +               return -ENOENT;
> +
>         return 0;
>  }
>
> @@ -81,24 +87,38 @@ static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
>                      char *const argv[])
>  {
>         struct udevice *dev;
> +       char *name;
> +       int ret;
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
[..]

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
