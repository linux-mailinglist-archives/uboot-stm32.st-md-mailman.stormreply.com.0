Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E869E88115C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Mar 2024 12:54:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87CC9C6DD60;
	Wed, 20 Mar 2024 11:54:30 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8735BC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 11:54:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d485886545so110244961fa.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710935669; x=1711540469;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kpPuKbJS27tun20dw6uYeWoIbYqenN4IvA//JjYYxyk=;
 b=W0ANxvWJTd6NXhJm0lqAG/reGDek/ek5zlTSTiWvNyhW0DLI591MpGjY7/5gHb7rtJ
 WBNX06jxKbc3BUmPVZx6Tk27irZ9Y2AmcVtCkP9sEi5Jtz8o2XQ2MOxKnku92jJUkzWo
 oN5GBUnOcHKXObHsG2pJlngAkCQDR8FA6ENANUesQKQq0WaLc2CB4a12pyNwuyskeZCt
 TnPuwo1DPBr+tbJFWkQTJX6ZNx97Y0zGkEnDrTmXm4ot1Rnqz31S9hCZfCbW1w9h/pBo
 z33nHn5xqppXepIU1LiIWdVKd/UMefGbsNps3+ZFnCqWWjU1FVuXdMPwKv7MOwnWVXrr
 vrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710935669; x=1711540469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpPuKbJS27tun20dw6uYeWoIbYqenN4IvA//JjYYxyk=;
 b=BeLKEp+MWcDlD/AYGCAQ3im05wE4sAWM4WCz5Vip4Njt/8BPWLVeIzOdt0XYT9fLhe
 KX7avhmi68ZG72jwqq8Bdczbu7qtBDIdX1pBQY13k2T7JZfcMyjQgBGOjj2+dC9HwigS
 4k/3JiXfBjGAltN6asbGu8F+UXa4gHElSRDv8C5cr2nvSTClY1dWa1grFumQWcgnT6Uu
 dA6YIFCnVW69BfZDdadD4sHti6IXi+z3G8LJbb/U4BzerW0e7WygeL85MbpmUXOogOIB
 M1B6wuV8wBVLN1XQtD5k+3tnN5bb4z7LaTVrT7c2kDjKXNTDfKHDOf/4V1phOTcZ1UQO
 trlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxFLsCfRwC+b6VaQwjHW17rK1oJWyP8qSreHIf5HHEJPK97AHTc8OO4z1ypHImjrdhPFVUZR1kkt3rI2IDje/7jg21gw6WdoheeDWq3PhIVkVJ+GRN8JDP
X-Gm-Message-State: AOJu0YzHGlwzoHsQ6dFX/2mbjO08oKLrMjYAKbY42A5GodsO2mj+x4sL
 5cXHNWR1FqqKkgut0z/l11mkguiJRuqeWdApu0giNqn3I0i375wkXjVPj43R+aqLlRfQZyNccJt
 RDv/u9oFEVBGhEIhwp99zFCEIOgXR0ZGyMbi7vA==
X-Google-Smtp-Source: AGHT+IEtofKOYwTdBpc4r0C5ebnDYbSqOea8RwW+udiUooadDCCYZ6kAvM0HJ1uM4RdV4t26MK6oA3ZfI0imx4rp+hg=
X-Received: by 2002:a05:651c:388:b0:2d4:707d:8b3c with SMTP id
 e8-20020a05651c038800b002d4707d8b3cmr9684517ljp.18.1710935668549; Wed, 20 Mar
 2024 04:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240320113051.1.If084ef69b9da34900391d0f0acc13475b250ce9f@changeid>
In-Reply-To: <20240320113051.1.If084ef69b9da34900391d0f0acc13475b250ce9f@changeid>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 20 Mar 2024 13:53:52 +0200
Message-ID: <CAC_iWj+1j+WR0aCTLA9Z21j347FpT95t3iWZnJoPFhH5E9jScQ@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: Add absolute path to
	EFI_VAR_FILE_NAME
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

Hi Patrice,

On Wed, 20 Mar 2024 at 12:31, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> If the ESP partition is formatted in ext4, we got the following error :
>
> STM32MP>  setenv -e -nv -bs -rt -v OsIndications =0x0000000000000004
> GUID: 8be4df61-93ca-11d2-aa0d-00e098032b8c (EFI_GLOBAL_VARIABLE_GUID)
> Attributes: 0x7
> Value:
>     00000000: 04 00 00 00 00 00 00 00                          ........
> File System is consistent
> Please supply Absolute path

This error message comes from ext4_common.c and it's ext4 specific. Do
you have any idea why this exists?
What happens to other filesystems? IOW does this change the behavior
of the existing code if it tries to write a file in FAT?

Thanks
/Ilias

> ** Error ext4fs_write() **
> ** Unable to write file ubootefi.var **
> Failed to persist EFI variables
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  include/efi_variable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/efi_variable.h b/include/efi_variable.h
> index 805e6c5f1e0..8d507460b20 100644
> --- a/include/efi_variable.h
> +++ b/include/efi_variable.h
> @@ -92,7 +92,7 @@ efi_status_t efi_query_variable_info_int(u32 attributes,
>                                          u64 *remaining_variable_storage_size,
>                                          u64 *maximum_variable_size);
>
> -#define EFI_VAR_FILE_NAME "ubootefi.var"
> +#define EFI_VAR_FILE_NAME "/ubootefi.var"
>
>  #define EFI_VAR_BUF_SIZE CONFIG_EFI_VAR_BUF_SIZE
>
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
