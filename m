Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF41605AB
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 20:03:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8659BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Sun, 16 Feb 2020 19:03:10 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD64C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 19:03:05 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 59so13995966otp.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2020 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSI3v0hWpaWuBlgmWScE3UP2FbdDo8XtFLQe6JATbxw=;
 b=ghOqmCXJ7Ni/mykrgd3RHB0ZdqIe8Gk72V83iQhaUtJnwowbdxQJ7mzMSmESdP2UiV
 6UMRLhHtBS4bJspvYycYlShwqf0cJlqb3aPbvJ3r9iwTdyd8J7n5jCAHmYmFT3C7mPUZ
 UDhZiiL8rT3yq/CEHnyzLciP+Hzvyongs3BRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSI3v0hWpaWuBlgmWScE3UP2FbdDo8XtFLQe6JATbxw=;
 b=ehlcKx60lX2KuoKouLtqjVvJZ8TFwZWFiahVSjVlBKt3kchB+P1wyhEzq72cvdKn1k
 JldQcGSLkWi2yYk4ossxxOvRmN5gplcvhYvGNQ21c59sEaBtSEbL7QnLR1tiFgydSbQX
 5JdF0LwdETWnLXS6tIFOnZSvDIXm4pfQv+oj5MI158jfTXFrW6DKxdsgSZAwrpOm8qpm
 kmlQHk9M2JLihSbtLgefsPLHI+/VbWHWymVJls61qQCkFNwTS8UbybUwAfH2fqit9hFg
 MBSX92KqJw/Ltr5gcirPtAXqTWR3XOcWrMr/GpxnIMloQI8c8iPdUd6bHkvwVgQoLp9Q
 jzxQ==
X-Gm-Message-State: APjAAAU2pPJCh7UWbDE2smPMGlCknSf2+1LIRXLs+lDalCS1jhaLr9eM
 CZrjhZvJCwBK9++UaXlnMhxJk4O2sSKayIKcVMw7Xg==
X-Google-Smtp-Source: APXvYqzsstt4vhspxb1TQg9VwARP9bs4IM2/m+ohktdMHeJea+ejzApXF8K9Lu7J4M5LXMT/zhi3q1DXm721H8aV4+M=
X-Received: by 2002:a9d:2dea:: with SMTP id g97mr9743812otb.33.1581879784081; 
 Sun, 16 Feb 2020 11:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20200212184501.5911-1-patrick.delaunay@st.com>
 <20200212184501.5911-11-patrick.delaunay@st.com>
In-Reply-To: <20200212184501.5911-11-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 16 Feb 2020 12:02:48 -0700
Message-ID: <CAPnjgZ3-qu72tnfEbYBn8rcPPTKfHbjB11gqC6HpqT9v5TQsyA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 10/10] test: sandbox: add test for
	erase command
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

On Wed, 12 Feb 2020 at 11:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add test for the erase command tested on ENV in EXT4.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/sandbox64_defconfig        |  1 +
>  configs/sandbox_defconfig          |  1 +
>  configs/sandbox_flattree_defconfig |  1 +
>  configs/sandbox_spl_defconfig      |  1 +
>  test/py/tests/test_env.py          | 20 ++++++++++++++++++--
>  5 files changed, 22 insertions(+), 2 deletions(-)

Can you write this test in C?

See ut_check_console_line() in mainline which should help if you need
to check console output.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
