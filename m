Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DA2732D
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 02:18:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA84CC10A2
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 May 2019 00:18:33 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06A96CC10A0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 00:18:32 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id s19so3813531otq.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 17:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sC9k92OjnBlGV60lrgxrMpW1Ys5U+9oNvX88BCl9MQY=;
 b=B1RIS57aNl02TtJ3EQ+lmDCYYmC/1ZPKVOitWmkShTrNvDhHkW4RWkXnJhnT5KAXzz
 u58+cSzlCuJ9ns0n5Jne2H/sIT48KpOSkzvLImsX2MyjzlreLI1w0qE933ZaCzS1nhmY
 F4E7KV2I9FhY1nw3ioKoco7tgxLtdKA+lVsxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sC9k92OjnBlGV60lrgxrMpW1Ys5U+9oNvX88BCl9MQY=;
 b=AXmpnhspF8SbeYUMBXD2O6E/M1OLOYACHUGN/06uFV3nVkksNaxtTP0BcdxoRYo+oz
 lWJlOclKvoXIneWIMBrqQYGCcniudvhCnLN3ddZNQXy4KswZmHlyQr093JrXT7Q2SgaT
 /3squOYcjpCwKScDrXFk/W9c3aBHMhKBSVSvG1l3ey3Ypc0/sTkI07ymwG7VnxhkAv4f
 hZMydvW6NLfzZLkhsxOBTQ9BKLRrnnsLpl8toIIWmID2PXpO2IAYCoYUeWLNsoSbqfw+
 HZKCSnKc/k9UIkS2CXciScRnAN/WfFO6O3toD90WmnmuUwD6c1lqhCrN9ira2BuCVuqx
 EO/g==
X-Gm-Message-State: APjAAAXyzMf3wFqAdjqY1NOn6PXKuMyVDax3RqYCHw5Hq2WHYjYmYkqn
 3jFyS/HinH7qDlQedSqmYrK8NMBUi4cSVbh3fozbbg==
X-Google-Smtp-Source: APXvYqysLHPTkTc0dor9X1Nde9yS9X2x7VxqecHpf4a3qN+iEZrRxzLaXaKJAvTfWd4hwwzzlAju2UgFYqbzudKfB5Q=
X-Received: by 2002:a9d:a6e:: with SMTP id 101mr26511587otg.356.1558570710186; 
 Wed, 22 May 2019 17:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
 <1558512409-32376-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1558512409-32376-2-git-send-email-fabien.dessenne@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 May 2019 18:18:18 -0600
Message-ID: <CAPnjgZ20ZNQVEus78oDhca1o7xr5LcGkX4XAp8Pb6QiVOoANMw@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/7] fdt: Introduce
	fdt_translate_dma_address()
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

Hi Fabien,

On Wed, 22 May 2019 at 02:07, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>
> Add the fdt_translate_dma_address() function to translate DMA address to
> CPU address.
> This function works the same way as fdt_translate_address(), with the
> difference that the translation relies on the "dma-ranges" property
> instead of the "ranges" property.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  common/fdt_support.c  | 6 ++++++
>  include/fdt_support.h | 2 ++
>  2 files changed, 8 insertions(+)

Please can you add a simple test for this, and also a function comment
in the header file?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
