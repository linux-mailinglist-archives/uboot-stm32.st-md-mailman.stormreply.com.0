Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777761FC488
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 05:12:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 188A7C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 03:12:43 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D7D8C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 03:12:42 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s1so1063820ljo.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 20:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tz4WnW5vRArG83DWWiIHhJfn1pjxEpVvx70ZEgfsBz4=;
 b=cxBogYxnl1IuPQMT/8f4Sitn08UBZX6s9cyqbq/p2uQGaLduGVWWjJPhCOtErN9PLV
 +BiM3NsTdgElsSTbB7N1dDbCU0ZzYOgzTVcMJNiMmKln+r9xSZGwivm3RXG9UVx8P2hr
 lWq9HlFyS4/gsq6GjR4PO2Sna4XXmgotbZwDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tz4WnW5vRArG83DWWiIHhJfn1pjxEpVvx70ZEgfsBz4=;
 b=ieAXvzaZUDYDpJgo0+ahvFYO2z27Y6WhT3gcQnUWo2Q/d1wfgmS/eRL4LfccOuCE5/
 u8wpOrLGBrFo9MdVZgdDMFQp0b839VbM8k8nbKylWAPpk5skstv3yDhvFqNv15oeokg8
 YNH33JdOwE0aZbVyzNHMq2fzqTGKsmAerWuC1CjV3jQwACfcdW5hZQ86VE8gof8I1ZXw
 NTKXZNzwn8Y27gAsCeIvAcgjSDVR6WRjIahXVo/vuv7Aaly01FEPzcYTp8GDWkwDwsRI
 hRac1PvReZw76RbzmOHY2FF8gqKx/gGRt/VnTN2k31U62gPU5PtQoD6UE4epuBwvQ9oY
 lj5g==
X-Gm-Message-State: AOAM530fqt7xaYYje1TlwwHQSvIcApO7sO2n6QU7eEECX+ip/0uBPlTF
 b9BAD7lsxA69GKGnA6Bp0/7Xboc7FCWQU+55SMS5eg==
X-Google-Smtp-Source: ABdhPJxLi771ourAPx4+7dMyPEg9wihnFRnJBFSkNYEI0N0vSdYC1g03bDh39ZuNXjNRFRm7a5pnajJU32xzx7Kd24M=
X-Received: by 2002:a2e:89ce:: with SMTP id c14mr3131332ljk.406.1592363561237; 
 Tue, 16 Jun 2020 20:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-10-patrick.delaunay@st.com>
In-Reply-To: <20200616074048.7898-10-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 16 Jun 2020 21:12:22 -0600
Message-ID: <CAPnjgZ1zKpUN7h-UpLEKxREFT4fDLM+=Cx9th7NuO5Se5k-DWw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v2 9/9] test: sandbox: add test for erase
	command
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

On Tue, 16 Jun 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add test for the erase command tested on ENV in EXT4.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> (no changes since v1)
>
>  configs/sandbox64_defconfig        |  1 +
>  configs/sandbox_defconfig          |  1 +
>  configs/sandbox_flattree_defconfig |  1 +
>  configs/sandbox_spl_defconfig      |  1 +
>  test/py/tests/test_env.py          | 16 ++++++++++++++++
>  5 files changed, 20 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
