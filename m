Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A159724E850
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 17:10:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF32C32E91
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 15:10:38 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19586C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 15:10:35 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o8so1139732otp.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7KRcFvNyoXt0vRjZRbLjybAT98ab+tGHLCkjW97kiYo=;
 b=i0BEkCrHhfGi5uKMXs5kYI7GI62O5heZA193KGM92lmZKQY0pfrnhm0qBs42jNDGzb
 UDo0X5o/Gnv6YJxlRJdb9k8eEw9352Sp7rcg+d0eFAu7LTNaMAi1d+BNJ4s9GHB//pVy
 8IDAmnT7SmqxAIiK2H/izqOcKH8x9vTCoRS4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KRcFvNyoXt0vRjZRbLjybAT98ab+tGHLCkjW97kiYo=;
 b=P+tuHeVZ2bS4eACfz0jfGB/DdAMDD4suHC1JjdOZhvKgrzf24a0gCBcVeu7Qq4n67P
 sRzrZbQJVObVJRoT7+ZY/92SXvcWohRpHHOxi2j7xSNSUHgYC/DninbwQ/DmVp93wEHU
 OrdT3rw4i2qyUDvhnjNb1RyIPBjUcNNDjUV29fWb0EZpU9jTkp8ZwHqgaV/ILEpM7ZbH
 E5i5I+dZPe3pXOqY9FkCGD+xGHS/IVNpN65exlCvqPKueedoKXkCntKHh/zYCRfsFaEA
 NEo+8iBG7XRsoIz/AdzweniwzeBdwLbxrN/KkECLfJfQl9bdquqEGVGesuvezNuwua9d
 hUIA==
X-Gm-Message-State: AOAM5337bzN2uXQ2G5kTkkbroX2HaiML/gwPOkmjBAgYR1Zw+g4WDiC/
 SraMuVN1AkIwhWeb7ZLWh8jlNzpXcBUM4omGftMiTw==
X-Google-Smtp-Source: ABdhPJw8rbzTOjn7D180355j7KtcpC2PJ+Cr/itf+im7ByMPB29cL9ZH+o04mG93KrtpivZTl9yM47xOIKFabgCNIfk=
X-Received: by 2002:a9d:7d83:: with SMTP id j3mr5478805otn.339.1598109034405; 
 Sat, 22 Aug 2020 08:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200813114650.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
In-Reply-To: <20200813114650.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 22 Aug 2020 09:09:36 -0600
Message-ID: <CAPnjgZ3X01MMnhNCZ9+XpS6BTasmcKZ4RUGE5wLdevut1DO5Gw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Etienne Carriere <etienne.carriere@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] fdtdec: optionally add property
 no-map to created reserved memory node
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

On Thu, 13 Aug 2020 at 03:47, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Add boolean input argument @no_map to helper function
> fdtdec_add_reserved_memory() to add "no-map" property for an added
> reserved memory node. This is needed for example when the reserved
> memory relates to secure memory that the dear Linux kernel shall
> not even map unless what non-secure world speculative accesses of the
> CPU can violate the memory firmware configuration.
>
> No function change. A later change will update to OPTEE library to
> add no-map property to OP-TEE reserved memory nodes.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  include/fdtdec.h  |  5 +++--
>  lib/fdtdec.c      | 10 ++++++++--
>  lib/optee/optee.c |  2 +-
>  3 files changed, 12 insertions(+), 5 deletions(-)

Please can you check this as it seems to have a build error.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
