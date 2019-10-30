Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 116C7E94D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3FD2C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:27 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A90D1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:25 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 53so727420otv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8cFQCKZfwWHHMdRbB6MKPCgp31Y2MZ4VLpxcPNwXLg=;
 b=KJ8+nWpc85BY69yhx2dY+hC9tSxaeYKtCdlIgEAtJK55y2cNmqbh7Out+wz/XBZq2E
 yTSmfx9sI4io+jJkZ1c/WzmLVJ46GqAUeym0lphTZf9QJg9fVqmkQT+L8EKGtMuy3WJU
 oLQCWiBerpCimayQrLIcL/KeckFth+CQ5lPYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8cFQCKZfwWHHMdRbB6MKPCgp31Y2MZ4VLpxcPNwXLg=;
 b=mKp1I5Snp3c4fBOHGihif5hJly6JhEanlYViIvO2UMYsfCFHLxWGGBLn90KwhViuD6
 1RIdAGU+g0FL0WNdNgBZjZGacFGfNeX9f/0mRrQnbaYpMIrZisYc7ROjuK/bOroe3B/e
 iE4A4V955NfB4HNI/4Vs8+hg3Ab8Wtypn9SW6MTR1rOJktvN6jGOre6TAm8DPtyTwtqQ
 iPXRNsY3KB2DNAzqIaX4PRg9Vog2FbOOYXq3+IyXDPfqjDNIpTnCAvetuj2JZ7yfyLT2
 PKUAZEadJLfRja3NH9Ez+Q7cFLP7GBr44rtvC97LJxlqoBZTywJ0Us/5xY/UPZ/ITGHH
 JRWg==
X-Gm-Message-State: APjAAAV5MHQJExIXPLcOZBBqbj5OQMuS8SF+qzyxDJg0nW7x54kXi7M6
 LSWsAxFai4rABjJ7OzB2NbYj7ohF0zSH/AZrhfFK+Q==
X-Google-Smtp-Source: APXvYqyZ1ghyyEI+/1HfQRjk6VEpZjlkNAk/hASmnD9/jIp/pDBzhpOedQNyP3bciT6InNLb8MWJy9xXFzHRkhkSgSs=
X-Received: by 2002:a9d:5c07:: with SMTP id o7mr20589785otk.33.1572400104056; 
 Tue, 29 Oct 2019 18:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-9-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-9-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:11 -0600
Message-ID: <CAPnjgZ0ecc90Fqvcexzmd9BKb1K5NrHc6DanfL7RD2WJJj3bAQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 08/13] pinctrl: sandbox: Add mux
	information in get_pin_muxing
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add param information in pin information output.
> This update prepare unitary test for pin configuration
> in pinctrl node.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-sandbox.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
