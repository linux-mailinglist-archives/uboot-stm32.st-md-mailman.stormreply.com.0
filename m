Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 158162C8EC1
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:12:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7CF6C424BF;
	Mon, 30 Nov 2020 20:12:57 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4032FC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:12:57 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id o25so15598407oie.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nP78Fd1n5OeXb4jagUXpdXwZI/YAdPI1CniZPTeZNM=;
 b=BdalObLyuJNYEiVdYr9yvsvdiTcfh8fMJjJRwIoLxJU5eb3jSe3Q/nvcEscsAFaVWe
 I4SRzpNA9DTFCZR7M2qSB4kfUVaZTgRwFL8pBRBf9Ao0kJb1COBSDZxYPjpFCHm5/2xk
 tbAqxpFmH9dC5cpreCID4GwWnaRYGICGBi+G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nP78Fd1n5OeXb4jagUXpdXwZI/YAdPI1CniZPTeZNM=;
 b=orCm52+qDWvVvzWd9QVh3TjN5lp0DcScn/kOHR+qjzOFAaQAC8KvG+K4m8dGZAT0a0
 7PwG7Sh4ETbidNI9rSfPPGL5ZiRmhjwIjZiSgjZd0fu7ZAFkgC7J4L+mjh6+mAKJ4hVY
 VJFmHf7kvVsAL6ZZs9zFU6sk8awUa+GSVV8qYiGizZW54w5hQZT/JEDMYyBZbPFADdXP
 HvsHXwsgnYKz5J4uiT/XaCiTjoUroGPXcCUtJ/hipoIGg8NhmwcRVCF3oa7yhAr8mIwB
 Rix60P3yRR/YrRNILNiCPrjkQFwxksmyyPZW3hMExvV9ePyL082qBMSpY4iPCI8BtPhh
 D80w==
X-Gm-Message-State: AOAM530ARZRJurHy2dJMYmzHqhIO8Qrw2v9wMzBFIwzjOST/vFxhLnmG
 9dYHCp4nDLEJiA0dBPPrf63TvAjqyR+1RQnON/pR8lsunnOMUA==
X-Google-Smtp-Source: ABdhPJyDNJlTFnLLtXgZlNQEBzTXfDIRqdzg/KUdCzUn1bD7qySZq06zOiaUz3iDTKLqH9bPc/BgkQpzQ0THyqBpy88=
X-Received: by 2002:a05:6808:8ec:: with SMTP id
 d12mr492544oic.150.1606767175778; 
 Mon, 30 Nov 2020 12:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20201127104930.32692-1-patrick.delaunay@st.com>
In-Reply-To: <20201127104930.32692-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:10 -0700
Message-ID: <CAPnjgZ2Z20Xoipi1QqdW2H1sb=ScGs_Dn6qYw4aR_BJBdLcssg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: sandbox: activate DEBUG_UART
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

On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add CONFIG_DEBUG_UART=y for all sandbox defconfig
> as it is already done in sandbox_defconfig.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/sandbox64_defconfig        | 1 +
>  configs/sandbox_flattree_defconfig | 1 +
>  configs/sandbox_spl_defconfig      | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
