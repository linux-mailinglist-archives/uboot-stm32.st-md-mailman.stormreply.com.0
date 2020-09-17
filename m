Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7939C26D063
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 03:10:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44762C3FAE1
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 01:10:01 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8968EC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 01:10:00 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g96so343025otb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 18:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmFk6W2znpiSGAQ0gEB2Mmd+IHE9tRPHg+lafy4jkZE=;
 b=L8Z+MTltouW5e0xLlbxdDnoBgRG8V02BczKv+UNGmgItNa9m40kqVT2V1d0w1k08Bp
 jkScXQ9VuxnxD7DkuKYT1yEJV14H+JpKeNdgS+ctufSgfmKzD42J37gHPbbAiiD05/wN
 LCS305OabuTfLhnYifDqWCRgiA5zGT1CcOKtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmFk6W2znpiSGAQ0gEB2Mmd+IHE9tRPHg+lafy4jkZE=;
 b=CR1iO2KsUVMCqPvqQ3DQBqOOGjoewX/1JZ4JTX+idHsMLcNWkzxQPEH3np9dRrUerz
 DUmeRy0DVNXugDKgN/iq54GhFWLmhPCqjhzSxdkBYPOX5pUPO4Jm1iGxtr08avWuJH/U
 5/gA2T7ojiQdfBgDY/7tAGiPTL0lhW8xDS6Ld7H3OMSX21MzF2jklZyLwcnyRrGf8t6o
 J18QZ+X98olcvWybWMVWLRrEtHLwaF6SPs6JBNVKlPsS57ieHy+yDHB9Rkf3VQeY5mTk
 D+GGregS31pZq7Jh4wQUiCDKbR0XOvZpWt9ODkMV7ALj2tDGJb6mNv7cuGKs3yakOGSn
 8oqQ==
X-Gm-Message-State: AOAM533eEzbxdtklmA/OCdDIV5bt3Lc9JUFGdfo5EwnNZre72hfWGyu6
 YlDyB7/5K9LK19oe4SgYkigIdf2y9acZcqDhERaPPQ==
X-Google-Smtp-Source: ABdhPJwlVGllCaMkAhEaQrIPKhARa1ppnNfut+Aio0Q2+VGL06yOMTsZ47sVS9jwBHY0EizjOnfveiFlrd/V3aQUDYo=
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr18972309otp.339.1600304999002; 
 Wed, 16 Sep 2020 18:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200910161817.27535-1-patrick.delaunay@st.com>
In-Reply-To: <20200910161817.27535-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 16 Sep 2020 19:09:43 -0600
Message-ID: <CAPnjgZ0jyUFpDvJ6f1uinwuKFZztYTWrzAS5iZWRWwGDe4t6mw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] power: regulator: gpio-regulator:
	protect count value
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

On Thu, 10 Sep 2020 at 10:18, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update the size of states_array to avoid overflow for
> dev_pdata->voltages[j] and dev_pdata->states[j].
>
> As the size of array is GPIO_REGULATOR_MAX_STATES, the size of
> states_array is limited by GPIO_REGULATOR_MAX_STATES * 2 = 4
> instead of 8 previously.
>
> The value of the "count" variable is limited by the third parameter of
> fdtdec_get_int_array_count.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/power/regulator/gpio-regulator.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
