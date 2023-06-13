Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F572E664
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 16:58:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 225BBC6A615;
	Tue, 13 Jun 2023 14:58:38 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90B74C5E2C2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 14:58:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-977c88c9021so926381566b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686668316; x=1689260316;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mXnHNT6pRTgOncJ37SvI/slgdmvYPOW0YKorLWHIvHk=;
 b=hNF9Tcn7k2wti8Hs9gSEmSYDlmuKFEhj5HfC/AFYifdipz9OgFA4lWS2+b4+veXMT3
 5kzhCDceMqo7kXj/8Q/ajOMiPln5pTe/jB84+hh4UEHEMQv5YQ/+/ymJaa/rdLtHxABZ
 GMukZxcDWBqagrhdcCsEmBDW65YqfRofl2IRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686668316; x=1689260316;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mXnHNT6pRTgOncJ37SvI/slgdmvYPOW0YKorLWHIvHk=;
 b=Hc76XLcXsNE8w72PAaxYRWtxCL5xqa725g9MyB8rP3y46uEAtuJAFx98jUpocWNA6o
 oxqrteXn9EKyWkBmcCkCF4UpfgqeNJDsQRrX1IxSxZqcRTmESt5sinqawtpZj/Be/f5C
 oeRdEqFKuAlARs9p3XwFjwWI4QtpPqQgz+E/2yATgeDY5X2a4HutlPJJfx25UFVcZW/f
 iHxR0julefeHbhVFBcRVsGagtNHjIg9EOkqsN8RkXufH8kV3jDgXYfX+t8gifTn+17mL
 DA1qRPcLWKPExdzoN7nydbeqkCorRfw2N4hMM7vYjRlUM6wCgOscq5B1FU3w8IOFc/Ah
 YoVA==
X-Gm-Message-State: AC+VfDwotESdv4zCCzUhsDKp9N5aKHPsih3M1KejJ7V32zS7/xt8Geen
 evx2nG+ahuLnjFeHZfdL6AIB4FxHpyRnejpKIf9SEA==
X-Google-Smtp-Source: ACHHUZ6iSZpDqLG+4XAka4G7+QwjHyojB4eqaykToIO0/Lfod1fBFsRzv9jzA2lnG9+VnfCP54j/L2JKR1kNlvaS3v0=
X-Received: by 2002:a17:907:6d0d:b0:97a:13cc:558 with SMTP id
 sa13-20020a1709076d0d00b0097a13cc0558mr13098546ejc.56.1686668315836; Tue, 13
 Jun 2023 07:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.1.I21f10cd5db605f5c0fbdfd04328958518fa508aa@changeid>
In-Reply-To: <20230608171614.1.I21f10cd5db605f5c0fbdfd04328958518fa508aa@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 13 Jun 2023 15:58:23 +0100
Message-ID: <CAPnjgZ1ngjK-LrvHgp6dKjLQTcU0E2dGqfdGWELDZ=Zu7vV3Zw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 01/12] fdt_support: include dm/ofnode.h
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

On Thu, 8 Jun 2023 at 16:16, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> This patch is a preliminary patch to use ofnode function
> is fdt_support to read the U-Boot device tree with livetree
> compatible functions.

When will the real patch come?

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon


>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  common/fdt_support.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/common/fdt_support.c b/common/fdt_support.c
> index 2053fe3bad83..ffc59fd8b36a 100644
> --- a/common/fdt_support.c
> +++ b/common/fdt_support.c
> @@ -13,6 +13,7 @@
>  #include <mapmem.h>
>  #include <net.h>
>  #include <stdio_dev.h>
> +#include <dm/ofnode.h>
>  #include <linux/ctype.h>
>  #include <linux/types.h>
>  #include <asm/global_data.h>
> @@ -1065,7 +1066,6 @@ void fdt_del_node_and_alias(void *blob, const char *alias)
>
>  /* Max address size we deal with */
>  #define OF_MAX_ADDR_CELLS      4
> -#define OF_BAD_ADDR    FDT_ADDR_T_NONE
>  #define OF_CHECK_COUNTS(na, ns)        ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
>                         (ns) > 0)
>
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
