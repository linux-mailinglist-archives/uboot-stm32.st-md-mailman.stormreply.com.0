Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC12C8EBD
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:12:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCED5C424BF;
	Mon, 30 Nov 2020 20:12:23 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24662C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:12:22 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e105so556759ote.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YQgLX4c76aIpdOuz2df0ehiaI7Ik7XVd6BrGBBVf4Ps=;
 b=VqcbZxBuGLvZ7Rytg6audOJGF+NwmmkIK5UeUUcGPV26a6decBBEa5ejPjnks5OqgM
 4KPNXegFGZQ2jKyh41ycqaukqkTts2TlK4qvyK99BAPSNOIWGB7qqoE6d4vuokyVNa+j
 mcZaIHCGBOAPAoPbVED6kd0RLIMZqbYf8voIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQgLX4c76aIpdOuz2df0ehiaI7Ik7XVd6BrGBBVf4Ps=;
 b=lad+n/8C9/Vxx71b2imx1bR0aB4lAATwMqbkRldABF+2MdDvZRCyKQ+stmoq9cuykF
 oSuIO8iAtP8QdlbS/MKPR11p71MvYZO4XGUWBf2QEOetIlqrnua01OBzZUdU/tXMwBky
 HrRmVWAhl2tTDQjqguUOZ0jExldBdRJTVjuZHhAQ5kSRC5Vyc9EL/YK6ShszfkuXQ+FX
 3FJmxpAcSgUz4lO0Dg+Uim9EvPR+/g4I+hjQ8xnLIw0q8P/arj00lgtDpo8qCmXt0f24
 3nUGnrEsZnJYPC6Qe28XL6Q45YKaaSuOVJUPZAOT0VYH6mgHjxsRHyxyYGi5vzhbkcuE
 iY6g==
X-Gm-Message-State: AOAM533l0iOwo6JLXPXeM1SXuApRYqB5cGGCX6JqjuWlQpQv2m/DmX97
 I+EvrNhr3wo5oUOes7f9NQIzKyN5Lgv4MWsVHFSloQ==
X-Google-Smtp-Source: ABdhPJxjpPdYJPRNq7MrA52zU95IR1EKMVOEpRU76ygxJPQAbpW7Zewp9Dz5KY/76pIkyMCPZ8Nye/XjKtW0pZ9w0OM=
X-Received: by 2002:a9d:6414:: with SMTP id h20mr3570290otl.28.1606767140685; 
 Mon, 30 Nov 2020 12:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127112000.v2.5.Ic62431f5da403756a2cdf753ce3656555a4263af@changeid>
In-Reply-To: <20201127112000.v2.5.Ic62431f5da403756a2cdf753ce3656555a4263af@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:08 -0700
Message-ID: <CAPnjgZ1=TUaNa0x=OSDg0yFau8bU2=WoAMoFjPs43+TkJXFsDQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] test: add test for dropped trace
	before log_init
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

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add test for dropped trace before log_init, displayed by debug uart.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Add test of displayed messages requested before log_init (NEW)
>
>  arch/sandbox/cpu/start.c  |  5 +++++
>  test/py/tests/test_log.py | 11 +++++++++++
>  2 files changed, 16 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
