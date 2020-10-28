Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2729CD8A
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 03:10:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 599A2C36B0B;
	Wed, 28 Oct 2020 02:10:48 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00899C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 02:10:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l8so1630764wmg.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Oct 2020 19:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPReFqZ6d7sleSxCsGIDCL+3xCOKHVlCJ2FIInCbEIQ=;
 b=A9PKet+Na7EaMpZTIclvSKmQ6kW96JALX+3xwL2QLaaW7oEwmqm30Ds9Ud0t2mmSTW
 zCoC77wfNtdla0XJY19n8gizsWgZno88M7P/7OemygEpzqmFBcEh+Rn+5DyhzvGYYYaw
 Mcne+eExo5nJ9g+eLpUOSwUyUR9dnttOmvVkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPReFqZ6d7sleSxCsGIDCL+3xCOKHVlCJ2FIInCbEIQ=;
 b=MGYCthLM6WFvPoc5ucExDFFsIAgpo1+zMgKMRQueW8C9EspS2WBWaixryvsh72Tmpb
 DamvGiiEu1EOSWUJx4oS4f0HRlh8YuCprYRn9p8sOLyiB5zn23LSACKi10NbqtsAMvbj
 ge2VIRhqSsP9P3pMUEcs6xKrPsGlcLb5S6+6FIPE3qCnGg4PzMmK/23ZRNx8Y05hlF/2
 Of/BvidaAZXi0nsa2WwaQ2N906YXmD1dWVjZV/VOwXNckWb+4DC5FjFe9mYMOAQw+yAJ
 ALSwk1cSwXlsDVzydh18cUewEHvbtv/hSKf7uXL9rbOWzAXEKf4Kse7H/9GdGQQYDyjQ
 Y3pg==
X-Gm-Message-State: AOAM530MIknzRimsZOykGRJWIu6F/IQQTIZ0A0bXPi52cqpYmJwcfsWH
 9WPYKrUZybshi6LZQnPtZBm5lukVh7uERVGr9iz0wQ==
X-Google-Smtp-Source: ABdhPJxjt3qYXH9774NScybmYxEvJuJLhofWeP6eV4TBJ7/qyUaQQ/bN7mWVYCYpL9eb2UOSPKJ3lfkXBMfknN4B7ZU=
X-Received: by 2002:a1c:68c1:: with SMTP id d184mr5433619wmc.74.1603851046198; 
 Tue, 27 Oct 2020 19:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201026083142.6395-1-patrick.delaunay@st.com>
 <20201026083142.6395-2-patrick.delaunay@st.com>
In-Reply-To: <20201026083142.6395-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Oct 2020 20:10:33 -0600
Message-ID: <CAPnjgZ2p89S70c5zuxfYq71ZUmTavjCcN6rop49B4sNyzrhvoQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Adam Ford <aford173@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: Kconfig: migrate
	CONFIG_SYS_PROMPT_HUSH_PS2
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

On Mon, 26 Oct 2020 at 02:31, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Move CONFIG_SYS_PROMPT_HUSH_PS2 in Kconfig, depending
> on CONFIG_HUSH_PARSER, and remove the default value defined
> in cli_hush.c under __U_BOOT__.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  README                       | 7 -------
>  cmd/Kconfig                  | 9 +++++++++
>  common/cli_hush.c            | 3 ---
>  scripts/config_whitelist.txt | 1 -
>  4 files changed, 9 insertions(+), 11 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
