Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED7E94D3
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E23D8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:31 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A8FEC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:30 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id m19so741911otp.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=reTBeapUHa32WvxCxvtA1FHVNfVBoiR2nsJd1gvPWhk=;
 b=T/VykJ8nuXG+Jsctd/yfVTnhJ8iW/YKdNd/pdeDGg1nz/UtKNtY1DQguFb5H400JCe
 bLi6z+ZE4Sbb1ZiOl2Ois1JW15lo6wwvvNuL3Jn3qhAE5/EVtPK4Gpfa25echHSyHsWh
 DZ5beiNZo8Ke38GBcqQ3MQwY8JEJtTGucvc44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=reTBeapUHa32WvxCxvtA1FHVNfVBoiR2nsJd1gvPWhk=;
 b=prluAOgG+QAHLRiSK1jOWIcQOzOD9a7Qx5yCNLmMauFwb0jWAMSJcJxVZDiuzqLB9m
 CpNbOAFLC2D9S9wb8jWRrHpxrJVUhh3hTkEVNQy/QkBB1vPoz9V68tGXp0Fx3gvG3pxw
 vcHcOXI43hOUZAxHb4Z8vXO+d+8UggDm+7JyrXAH9KZwPFyv8QXg++YvGdaKZGpflJgL
 fWUPF1n+YlZHUl7De3bPc1sFgQ7peK6DvMzgxbG6y2Fj5W5rmMhB+5lI19ZmtunyQf36
 7FTpUUn09EQBZr7YWt8bvMnr7H6dr8rjbcfD4Nl3dbBdObIO37RSdl4BQY+G0GZKeHay
 euxQ==
X-Gm-Message-State: APjAAAUTHg2oy9pBeJ6sFg0IF3wEPjss+nADSokPZbVWT2gbc7YmwQrQ
 s8ZOBW1AJvOWwjlIdUCRdtiIWA6MLCKr/JEeCMOhCw==
X-Google-Smtp-Source: APXvYqy3q8VrcqJvLq6BFctUkd7GKChpc9VT/h5HTphe2Z6F538bLJhhSl5lLP6xq9yVRzbzg/c4XcPoS+ANAT2r1H8=
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr9359183ote.100.1572400108496; 
 Tue, 29 Oct 2019 18:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-11-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-11-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:15 -0600
Message-ID: <CAPnjgZ1vDgj9+3tf6GS00xmyiWUzebsayrW0Q5azMCotTunA3w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 10/13] gpio: sandbox: cleanup flag support
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
> Replace the GPIOF_ defines of gpio UCLASS (they are not bitfields but
> enum gpio_func_t = State of a GPIO, as reported by get_function())
> by GPIO_FLAG to access to the bitfield 'flags' of struct gpio_state.
>
> This patch avoid confusion between sandbox and gpio UCLASS defines.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/sandbox.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
