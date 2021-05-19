Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6A3892BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 May 2021 17:34:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CAFC57B69;
	Wed, 19 May 2021 15:34:26 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0506C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 15:34:24 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so930221otk.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zST4jPDVw8Wc5DUToQobiqjdjEPo0KmNv3b3Z1IyYok=;
 b=a2LN0BAEWsIQIDnz8zlZnZ/dw4XWBE36MDyRFXiC6U6Fd9/t8PJ1JQAzb9UR/l3ECL
 R7E1t0iaMlDvzmm6mO2SRbfyf/SvUNs4xvqnwldoRBGbCv3pX9c1Yoc6UjkVTr5eAe14
 Dgq0fOPCuuwMIPWMUnrBStbqdiU4TgxA0AbQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zST4jPDVw8Wc5DUToQobiqjdjEPo0KmNv3b3Z1IyYok=;
 b=oJKv37AklgRfgL8+bb9f+CVKmng7R3qZpC/7gz3TbivnU3fHLuZNFrzg585J41pLCv
 jJo1UZZIk5t3Dtu0onn1HR1gkagEjC93giummuEqvQwMSA08CauZYZn6HamRxxYcY+sD
 qnQbHEX7uSWHruS3UDqw8fseRrAcSiCoTRXWLNtcSA2hckkbMmAeB3k6BS+wBdtNW6mu
 doK2dqutK9RazUvb8qKE82dQ5XhHq0QrjYOqiVg/lB9dRtqqHvIuFbAN+pq7GgSVEY1Q
 4R5j28vyvTqB6vQo1aO+oirUsA5ap6qkmY8rs6M0bvhEgXm7o2GMDGG9oV7BRT/IZ7wt
 XoqQ==
X-Gm-Message-State: AOAM532Yk9UxfUt9X7d0cUygAfuN2hY25hzk2IhQE2tIyjOkUt5amcWN
 wkl8rz71tN8ezB49J8R7iS42iPxZTcL+OBUSQIWLlg==
X-Google-Smtp-Source: ABdhPJyjUtlUtQOXhuo9gBDb/1xbBLdlbcIFhNUsNpaVEkC1n+POG4J66ytri/jZpivWPskAOYTJgUPg9EFnHMnVaIQ=
X-Received: by 2002:a9d:6117:: with SMTP id i23mr19049otj.28.1621438463352;
 Wed, 19 May 2021 08:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
 <20210518154026.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
In-Reply-To: <20210518154026.2.Id119f821cb12efab440905cad658e8cb459ebd8a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 19 May 2021 09:34:05 -0600
Message-ID: <CAPnjgZ2OMkyaj1UxiB_LaZ25vK08XvThcKYHp-vfwbotEwyjBw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] test: add dm_test_read_resource
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

On Tue, 18 May 2021 at 07:40, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a test of dev_read_resource with translation or without translation
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  test/dm/test-fdt.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

But can you use lower-case hex?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
