Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CF82D8754
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:39:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BBB9C3FADA;
	Sat, 12 Dec 2020 15:39:35 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE806C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:39:32 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a109so11214196otc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KuCldRbzJacy1+T4rQOe02bVpgWOftmivig4qwTl7/M=;
 b=RTaYA4a/LrDaikcQ5BCcVBKZ09rCln5YUODbyZI58MKvIthmWfXzmyqqKhH/QIsKus
 DGeKVjy2PtaJdjLkiNJsc2LRwkdj6S4zCLEK3aLirlAPJEptzLDnNUhMrn3FRKUrK421
 FTMaIZn4T9Ehqf7+sLrejqaCOfwCH6FahYOy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuCldRbzJacy1+T4rQOe02bVpgWOftmivig4qwTl7/M=;
 b=WtUjQ58VPTDC4FUOFvItFs9+8JgwG2XN+M+kGxDVOVBbspp3J3lvLnuC+c6R2y6q2N
 +YlUVdKPxtPbq6rF4HWS86k5vIi77YybvWF/Tk5GOtGX5KY+wGB6Q+WyL+yjuxUtS5hq
 TaxH5A1YO66/4ZoMQe+OK59RLjp8q2SKXkf5hhS5/Y8aNf1wkS8nHL7zOFFWb0qx5ex2
 7AGN7UcC7oeyD9SxxcgcWvzOCyzDn573c69QU2yqI3ioJcRtOXQINBnX6xW+QQi7y8fg
 5yBJX/dyk4jxEDwM5KYOi8pEQGDUB6uLbsZqlYBt2r2IVkVn1Y21B66jfcwPJ2OHelvE
 RUtg==
X-Gm-Message-State: AOAM530AuuMyPR/O3J1RGbc9ceQY8wPHZ+0lMpKP1OQZNHFffOs6bsEr
 DvZCUO9YmD8mE/DYN/mkcN2UzuPf0apXgIB7Js/qtfO+KVRfwg==
X-Google-Smtp-Source: ABdhPJwwYwhTgisNae0Feg+WDeB5cx0P7MLoxmSRPY5rbbrWpTfpodIloXZt8+cM0XQ7ivU5Z6L5EYVXTrvbVB2Do7o=
X-Received: by 2002:a9d:4b03:: with SMTP id q3mr13623986otf.88.1607787571118; 
 Sat, 12 Dec 2020 07:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <20201203101538.5.I5d8905f50f0f31c0b5f11b7284d29a82c122cc2d@changeid>
In-Reply-To: <20201203101538.5.I5d8905f50f0f31c0b5f11b7284d29a82c122cc2d@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:15 -0700
Message-ID: <CAPnjgZ1M11-NaKmc8RyT8bH_pgGvLsaVNxWTQAAkUfPjY4AzTw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 5/6] spring: configs: remove
	VIDCONSOLE_AS_LCD
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

On Thu, 3 Dec 2020 at 02:16, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the obsolete CONFIG_VIDCONSOLE_AS_LCD as vidconsole is used in
> ./include/configs/spring.h => configs/exynos5-dt-common.h since the
> commit bb5930d5c97f ("exynos: video: Convert several boards to driver
> model for video")
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/spring_defconfig | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
