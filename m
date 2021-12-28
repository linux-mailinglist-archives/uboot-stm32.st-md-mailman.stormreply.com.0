Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A7E48076A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Dec 2021 09:33:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BEF5C5F1F0;
	Tue, 28 Dec 2021 08:33:13 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB848C5F1F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 08:33:11 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id u21so15782144oie.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4tfXh6dRbChuhAbkR0jSunIa0WGMl4ZUxC/ehxmtyM=;
 b=SnWl7EvnTTZWCfmxQZ7XNw1jkHrKXv74vWgT26ly2LurX2wLVu8SNG+DYH8ETLadaw
 RQ4Pn16hLTLc6Asbl+fhVzbBRRp6iaLPYmnwgnBF0yFAmTqSz5r9YDnJ8rA7PUs9zrYi
 BYIGoO9MUmq/GKs28V5AnB+EMbzMT+p9oddx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4tfXh6dRbChuhAbkR0jSunIa0WGMl4ZUxC/ehxmtyM=;
 b=K0A3i/ISCuXUJ54CF3i9Aadw3Nv9XhBJ33xXZY/q5LO/73n+hjoJiW9t4eBHRNV2Sb
 GIeOrTPfiOnrs/BhiaaTuC8j+6G2mGf4UAQiKjfB8EHxDoHmlRGOdOA0mLVWz2Rac5S8
 ll0CwJDXEYzzRlU4NJp7e5Jxi5XpB5bzhHWU72at+XHrIOoS8c0m6PXRTAridLSmioQ1
 Xc9lgcJUfMys5IcpA9mdfhxBgqSlwycKMZ60Cdr3C6zFhiHM/w0cLZSMN++m5EsnMmpb
 9FxLYLF18vUFPFOaq4OaUK7ozsa7wM2s6h1ibAtHskds9pt/w+YbrAo3fmHnFFyW1PQn
 sHVQ==
X-Gm-Message-State: AOAM531aw6hRbh2lWg9ORaoQE3mxgl32uGEQVhPzx0p4pdEhmQEFwFXg
 +t5hXJXtYTnlim/P5k1fmwyz3C9EkM56JCYmT4GR1w==
X-Google-Smtp-Source: ABdhPJw5QHoyzbo9uixslX6MXRPicDBsKqJ5/Zr3VHIWFnlMsTZWXYMZamJMi4XxDMQZ3MuE1BKvQk4euwf1l5/MPP8=
X-Received: by 2002:aca:aa12:: with SMTP id t18mr8954146oie.81.1640680390432; 
 Tue, 28 Dec 2021 00:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
 <20211214175652.RFC.1.Iaa7c4564c1e7d57e198f7621d124cddaa3296c4a@changeid>
In-Reply-To: <20211214175652.RFC.1.Iaa7c4564c1e7d57e198f7621d124cddaa3296c4a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 28 Dec 2021 01:32:58 -0700
Message-ID: <CAPnjgZ3Gpv6SZ1vcoEZw=0452=MzDKw-W87hDRdRZgmOw0rs6Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [RFC PATCH 1/5] cmd: Fix up warnings in flash.c
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

On Tue, 14 Dec 2021 at 09:57, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Tidy up the warnings reported by checkpatch.pl to prepare next patches
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  cmd/flash.c | 239 +++++++++++++++++++++++++---------------------------
>  1 file changed, 117 insertions(+), 122 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
