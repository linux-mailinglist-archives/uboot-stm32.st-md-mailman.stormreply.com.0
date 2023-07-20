Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF66675B83A
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jul 2023 21:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 726F8C6B44D;
	Thu, 20 Jul 2023 19:43:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F10CC65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 19:43:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso1870727e87.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689882191; x=1690486991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YXwYW+sI1xgNrbLU85yF2PZ9URlyQ2EXZ7p0XdBENMo=;
 b=hUwy387hJTx2JG9D/EnAFR3v0AozlAdxod2zZm6kvDGFvSUkSXUzMzqvjCTqBnr8V2
 NrM25hIqIkjhFVTKqB1GuzMRD9miRcFzQjGR/WaDtIOCkNSCpf4pJeCT+oW2J6pCKLe9
 rMLCX9dLorSKPQfDDYdYdgJ5aOk4oyICkXJTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689882191; x=1690486991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXwYW+sI1xgNrbLU85yF2PZ9URlyQ2EXZ7p0XdBENMo=;
 b=bBl4KJCS1jv47V9pK8jv4+/RJ5VOA+QSyaeANIgfErQU+o/4t67um0IC7iPv1U4hdZ
 wS+FFFc5E+y1khLuHbotce+IpXANb2NljCZShzzWEx596h5ZSRJnjNbfjNybR+oJQsEq
 27VETFp1EoCqUBlX7gSGz1LJlocCeJMZ1o30Dva+JYqc1oOljy0jPsr8Ds+gGOVRVuRs
 gx8/nFM8lH6e0beSldQyP8xqddt+VCuNFYAJovQ8/q49Vv8DKEJ+zPDJkVFTekeI3zF2
 PxgRwhcPCqMptYib5vEd+5KqDbG9csVo4HWR6ZmN4o5tPOkwyYNUXdCYlaXntHI6TIcU
 17qw==
X-Gm-Message-State: ABy/qLaTVw3vke18VHyrfXOFIvqtD6RUPmHZQka+GT5vw/IHJ8pqWrD1
 ENM2v73b31O2NgPw5e3V74BQcJu964djYCP8BrSVjQ==
X-Google-Smtp-Source: APBJJlF7CzcL6F8/g7FejUfNrFqv/ME/od7OjBn+yfIOolrxui/kZV6j+k1IJxwToc0zqtz2khG8rbS53OlDahhsqsM=
X-Received: by 2002:a19:5f1e:0:b0:4fb:77d6:89c3 with SMTP id
 t30-20020a195f1e000000b004fb77d689c3mr2753753lfb.12.1689882190528; Thu, 20
 Jul 2023 12:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-6-clamor95@gmail.com>
In-Reply-To: <20230720123744.26854-6-clamor95@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Jul 2023 13:42:56 -0600
Message-ID: <CAPnjgZ1XXXmi2CaM6WbaoyZRzsXE1o--PTcYZhN3C5FNVBwTiw@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 5/7] power: pmic-uclass: probe every
	child on pmic_post_probe
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

Hi Svyatoslav,

On Thu, 20 Jul 2023 at 06:38, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> Main goal is to probe all regulator childrens for their
> proper setup but if pmic has non regulator children they
> should not suffer from this either.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/power/pmic/pmic-uclass.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/power/pmic/pmic-uclass.c b/drivers/power/pmic/pmic-uclass.c
> index 0e2f5e1f41..8ca717bd5e 100644
> --- a/drivers/power/pmic/pmic-uclass.c
> +++ b/drivers/power/pmic/pmic-uclass.c
> @@ -16,6 +16,7 @@
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
>  #include <power/pmic.h>
> +#include <power/regulator.h>
>  #include <linux/ctype.h>

I'm not sure about this.

The idea is that power is handling automatically, e.g. a device is
probed and so its power is enabled. If you do everything at the start,
doesn't that violate the 'lazy' init side of U-Boot?

>
>  #if CONFIG_IS_ENABLED(PMIC_CHILDREN)
> @@ -198,9 +199,18 @@ static int pmic_pre_probe(struct udevice *dev)
>         return 0;
>  }
>
> +static int pmic_post_probe(struct udevice *dev)
> +{
> +       struct udevice *child;
> +
> +       device_foreach_child_probe(child, dev);
> +       return 0;
> +}
> +
>  UCLASS_DRIVER(pmic) = {
>         .id             = UCLASS_PMIC,
>         .name           = "pmic",
>         .pre_probe      = pmic_pre_probe,
> +       .post_probe     = pmic_post_probe,
>         .per_device_auto        = sizeof(struct uc_pmic_priv),
>  };
> --
> 2.39.2
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
