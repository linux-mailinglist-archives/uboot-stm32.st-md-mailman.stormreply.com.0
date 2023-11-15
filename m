Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA97EC373
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Nov 2023 14:16:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E608C6B47E;
	Wed, 15 Nov 2023 13:16:56 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E567BC6B47D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 13:16:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9d10972e63eso990333066b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700054214; x=1700659014;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YsLYr/fVOqs6jHIehgO8ZHyKWxJyuJCTDOz7rGFKbtw=;
 b=KlnUX0FhD4b9+Bwl1DgtabxE5MVJJv/5pnFWSaF/IzrkhXhOyjmJin+UFZWqicydF5
 spcTC8hF7Ze3myHbHq4BR9h1k8OwaydPPwTLEDbcY41MOQMGbKvTCoKfi6a50ZlbmcLm
 PcihPcvxd8Y3kOIh/1OVc6vezqBogsJtFfYgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700054214; x=1700659014;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsLYr/fVOqs6jHIehgO8ZHyKWxJyuJCTDOz7rGFKbtw=;
 b=H+2QiWffhlMV5aywNdrhZif1VAkOFaPdaBmVxr8sjNOd2UYo/dvtc1phu9IiGuCRpC
 tDqLO2G/zYobjwCEgXP18bR8zWFzu5ZrjnKdHNH5eUYbSZLuKjJAtvy29WsdEsKlcZ8I
 b1kjU3ALKVaD31UWqGlpjz7i+GgO8P4i7nreIkTay1z8V6GdlXEL+J+0C1uYnCzy/awS
 R926uR1ncHd4Lfc0PQ7F3axEEwDdOAoj/Y0Kk6moz/RSZh50vcndS/Y1fNpRvXr1b5WO
 IhbkubxCc8W0ctHacxQwTJwscpKwTFtD9OjIavARPqaVFtBNb5nFa9TY0YFnyWSLszp6
 bC5w==
X-Gm-Message-State: AOJu0Yz8CfCyZ0X+WgFTcLERnWLdnSeq4QR5F3ZwPuOJUmbHmoF3YBkX
 AdarZfhK9MLfb2llgJcdbZCELqZdcd2uO3q9DIAH2g==
X-Google-Smtp-Source: AGHT+IH0ocVZYM22lTu/xzZPITy3v6oP5qbOplUxz9Rm/xSV0xnYmmHdzSRVn+tQup2jUSS8waf18NngBWy9C8aZjlM=
X-Received: by 2002:a17:906:d217:b0:9be:3c7e:7f38 with SMTP id
 w23-20020a170906d21700b009be3c7e7f38mr8997934ejz.10.1700054214156; Wed, 15
 Nov 2023 05:16:54 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Nov 2023 05:16:53 -0800
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ2YgwAzsG2kHZZWgy8p126hBH_r0r55nParwOt5wjuW+g@mail.gmail.com>
References: <CAPnjgZ2YgwAzsG2kHZZWgy8p126hBH_r0r55nParwOt5wjuW+g@mail.gmail.com>
 <20231107101729.1.I843fdbc83d3f8522e4c43d47c72825b388643ac6@changeid>
Date: Wed, 15 Nov 2023 05:16:53 -0800
X-Google-Sender-Auth: iPCdaeRqQPVrPSaGNTkf31LHMOk
Message-ID: <CAPnjgZ3EQGbHMWuKM1d8+Whs6FWZ4SGoOO-9=N51EPXsswqWwQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, deffo@gmx.de
Subject: Re: [Uboot-stm32] [PATCH] bootstage: Correct exhasuted typo
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

On Tue, 7 Nov 2023 at 02:18, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> From: Simon Glass <sjg@chromium.org>
>
> Correct this typo in the warning message shown when no more bootstage
> records can be added.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> I just cherry-pick the Simon's patch in the branch fix-bs-working
> of the dm custodian git but it is not yet present in patchwork.
>
> https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/8810b8dd3d233978c15203b23420fa819ab1e791

Reviewed-by: Simon Glass <sjg@chromium.org>

Thank you


>
> Regards
>
> Patrick
>
>  common/bootstage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
