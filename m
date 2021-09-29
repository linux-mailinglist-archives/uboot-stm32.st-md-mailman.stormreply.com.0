Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF641C704
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Sep 2021 16:41:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B89AC597BB;
	Wed, 29 Sep 2021 14:41:46 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF695CFAC52
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 14:41:43 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so3086645ota.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/5s0ym+hlRs4r1/QBAVvslPoweGAWeESr0q2dhkeb4=;
 b=bfwSJuVfxj6GVZmg5z9NNuUGtBn2t5u1kbuLFDnTCKaugQbVKX3aJSrLH3Ra3va6J6
 70Tz3aVXyc0JaAFmUKSSYZ+jPkunxqpTSy2ubYv6UWqYGBBrbUJNiCEVaBza8PGKavCb
 RIvgOoOLzqvZVnU7W5kjMw5S0QjPIt5hgdykIUsGaCWRBpGGvozsYCcqfKQ+QimSNBN/
 Ttcae01fp2qL0OHVGiLaLCSwNUmQ7SgJ4i95eQXVn1yDBGxEXhhCtrNZWfPFyFuJBQPW
 7HRup2qTKPAQsmK5Iutl8DuHI58OxQoYA9L4Wm8Glat8i89geffgEff13DUqQV/hfeIC
 rp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/5s0ym+hlRs4r1/QBAVvslPoweGAWeESr0q2dhkeb4=;
 b=tmKBTwuhFnuYM9zeeZA0X9S1uPLMqZWkeBWRigldK0veAeORRKJVS4YdndLcSP5tev
 kb0yM+OyfCLgMHK9sSuIQfbbRsIiRVTPfQNupwr/VO8AEO+PXpfEuEXIJQyqtzp3Z2tv
 31Tj+P5FrkTw5KwcxFkyD/RMXVIGh96X9xi8CTJxkFX48u5wzm/rAjsiXiH26lUcfXkx
 AD3GijFGRKRshlnPCptpVJieHP23skZFP2xuuZa6fvfzVSs2zgNubjKdeTjBenmaNZ7a
 fGzLw0420/7WgLkZGOUM0XkUT3av5FwbK50ktse3fXBpkjqyLS3VCxWpRbl/eMA7U4KB
 xFIg==
X-Gm-Message-State: AOAM532LEpUl9cJKVVXvU9OIt+/7mCE4gTWvsCIxYqQWOVng1FIo1pGa
 mTT/yVXDeDCjo/oPw/GI5zw/mn3xW9Q=
X-Google-Smtp-Source: ABdhPJwxA4g2t03GN7zxRzmdavJryMfzXk1YUEpGLbfywwNbOs0NuY1xxvUfWMCrrvQtgYgg8Cw6EQ==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr369462oto.112.1632926502092;
 Wed, 29 Sep 2021 07:41:42 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id a1sm486729otr.33.2021.09.29.07.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 07:41:41 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <521feae1-f487-236c-bcc9-7dff7da2f80a@gmail.com>
Date: Wed, 29 Sep 2021 09:41:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: use ssbl partition
	name for U-Boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 9/14/21 7:14 AM, Patrick Delaunay wrote:
> Continue to use the "ssbl" name for GPT partition of secondary boot
> stage = U-Boot for basic boot with SPL to avoid to disturb existing user.
> 
> The "fip" partition name is only used for TFA_BOOT with FIP, it is a TF-A
> BL2 requirement; it the default configuration for STMicroelectronics
> boards.
> 
> Fixes: b73e8bf453f8 ("arm: stm32mp: add defconfig for trusted boot with FIP")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
