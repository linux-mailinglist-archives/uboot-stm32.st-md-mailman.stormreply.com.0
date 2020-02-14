Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06B15F6A8
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 20:16:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C48AFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 19:16:51 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97D13C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 19:16:47 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l9so10451399oii.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 11:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=megRB3QVk7bMeCvvYov3cizPCVyIDG+zIWYAN4/wGjI=;
 b=B6/L5T/JL8G9XHMcbIBLITmf//EDxtCuxU7AeOv3FZbHL5a2tRan9Uq/FGpraEFIj8
 LNNmX+kqqEkl6RTkLx2gB/N/mgqo3DFzLJgI6bvVIKcUjsdpZN61iSCYn9b6wYv2NTdf
 wrG4MHzvaz+GBTIunF4BQ6mAsCUo3EBu+4JGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=megRB3QVk7bMeCvvYov3cizPCVyIDG+zIWYAN4/wGjI=;
 b=pRhhOdY6fr3rYTkjF1OpZU36/liJuQYshNtFRDMmBTsSulSdxShFCqy0qzWhrABKn2
 lyKhGZQCV0dAibk34F5snYn9MM6lglOQZRPrKnNvLd7glGc5SE2w1y2zyD64ENnqDcfU
 b/27IIr/BwcgCDEqr3OAGR33neVp6JBeMurrBTw8UNCGD/LjH7tbX1uzxAXv7ouSNUJ6
 9JVV4FKpQGhgH9FAJJlXkeAtt2f0JITvcibM44iz52FT/8iT3DMlrH0inETLTJMFEepl
 kWVkG37PoxRyE2bUQCCBP2zsPKe5OpBVer8OxOLTpTHy2kK8QNDipPsBGlKztKZ6PZfI
 A5rA==
X-Gm-Message-State: APjAAAXrYg1yPU7GElwGnA8qY6L2tpEHOfHyQv8vT6Dax4weuWjVRCJ1
 ZpA831WYKLMJLbmeJiWVgDForsAt5UM+DpvLNoJoog==
X-Google-Smtp-Source: APXvYqxyD88FLxj1zEHQC656Y/bVsUtEs0Rr8r6Wse2O6XB6iB88mwJQYsMKd4nxQjEQVY1A6rm7TU4YZtTi4++EaPs=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2984511oiy.170.1581707806269; 
 Fri, 14 Feb 2020 11:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20200213182950.10744-1-patrick.delaunay@st.com>
In-Reply-To: <20200213182950.10744-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 14 Feb 2020 12:16:34 -0700
Message-ID: <CAPnjgZ2aHJ4ReOLHLnJ8LcSgMngC1Z5===WMJob4M6Y_sC5QVw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: bootm: take into account gd->ram_top
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

On Thu, 13 Feb 2020 at 11:30, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@st.com>
>
> If gd->ram_top has been tuned using board_get_usable_ram_top(),
> it must be taken into account when reserving arch lmb.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/lib/bootm.c | 3 +++
>  1 file changed, 3 insertions(+)

Is this something we can test in test/lib/lmb.c ?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
