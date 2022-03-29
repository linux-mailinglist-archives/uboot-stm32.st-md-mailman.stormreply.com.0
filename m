Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563D4EB18D
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Mar 2022 18:12:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C897C5EC56;
	Tue, 29 Mar 2022 16:12:25 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64B94C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 16:12:24 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2e6650cde1bso188362697b3.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SsjGJ3DnrbcR8+PoeifIpEYf7f3EgHNQ4YkPk7B9zkA=;
 b=d231bn0/Gr3zj7LTd0zu4sAM33aEYw+9NUyH7cKdqpERkhEDwF6bN6xV16QkriiomZ
 2q93yW9sgTlEs6bd1UQ6hzsYMJRPWzONDa2PZnyyfTivOlX+KTZr8YdljbnDxRoxNuHz
 IMmSv3FhnVoSJGY6TtJCSTibx3MeVMfwuEFtJo9GBuziGTUPTG2u3CPLgJcVqFV4UA7w
 +1Hj6ELvHVacOIfRk97EboRQpWgZ9+KZmQGKqoq1Qi+gCX41xxTHR/0zfZ3RsqRKf6HP
 KwbI569MpoWUyOYcKRztGna9CT3sy0x6cJd3EcuMyEAnWKtowCAAo+zCub238Wn1LgeP
 5/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SsjGJ3DnrbcR8+PoeifIpEYf7f3EgHNQ4YkPk7B9zkA=;
 b=wwJZ/Hk+W57Ljx9jxbxH0sYv6ZGkHpEdMKwcUwZgk4zWi3KfQanTW4iXEAsJVJ/CUX
 sVCPxa0RIm5vXaTQfs2stunuyxGR835XwJStJG72y/m6Dmke5b4jgKXSi0HAZybRFXkM
 weotABVrnY9vgciroPef7ECqOU9xZaWiYyQAt10IvS8+NybOEGkVzMtK3URwn7BbU2bE
 z9Wn/VCIAEY2D2WhJBe9KBro81TwwVg4DntZIz3KKcM8anPChP2x8SDr7HydLUL7SryZ
 xChgWgNL8EUXjfrPU6d4a5W+eomQy110S7Q9RPwQ/r1FvAU7UYALxwl5L76FIJ6DCwBA
 kp4A==
X-Gm-Message-State: AOAM5325fEH6H2/OqPIpfNt3yZWmDV+ejqIeyLxfciuOXPyxKlsM+7UY
 0v+BFtCSupvS/4xcis27I/5MUtl0nsssrFJKIGg=
X-Google-Smtp-Source: ABdhPJzVT+GFfIw6xBD3x5zAIWHE1mSyMHmqGk0CDj5juGBJdGemNtkbyML9d9D//En/T0ZiVDoEo2vVlTrWDKPXJMw=
X-Received: by 2002:a81:1bc3:0:b0:2e3:aa1:f553 with SMTP id
 b186-20020a811bc3000000b002e30aa1f553mr31579074ywb.491.1648570342284; Tue, 29
 Mar 2022 09:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
In-Reply-To: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 30 Mar 2022 00:12:11 +0800
Message-ID: <CAEUhbmV0oZ+1WCaVMWQXiM2=916i-5GHmeRS0y9CSbbygZKr5w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Reuben Dowle <reubendowle0@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Aswath Govindraju <a-govindraju@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: mmc dev
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

On Tue, Mar 29, 2022 at 10:01 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Provide human readable descriptions of the speed nodes instead of the name
> of constants from the code as it is already done for 'mmc rescan'
> command in commit 212f078496e4 ("doc: mmc rescan speed mode").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  doc/usage/mmc.rst | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
