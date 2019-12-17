Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C941230C3
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2019 16:46:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B37EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2019 15:46:44 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383ADC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 15:46:42 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j22so5688291oij.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpkjR9FjXutv95UlWnUFLahF5fQqgNRgQqepLcIpPwM=;
 b=YIPRkptbwAmtzWOeR4GX4lGVoL1/I802M2cqQ7TTeZYHpSCE7M+xj81hcHcKgaldCW
 IlzRLghXHrc4iNk/YBPqzwcoFv8g7yM3sQDEG+Q9cJoF17oKoLan83ddXCzh5b+3b8rl
 Ns1FVsVxT0ilkxDWdMupnlQPHlrCdPuLHeDx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpkjR9FjXutv95UlWnUFLahF5fQqgNRgQqepLcIpPwM=;
 b=qtmnmY8EXSBYhtSAm4sLXApntaDhN07PjK3aIA69KVXszuoOV7WB3lw/OYpgm9XAA5
 qb9pwb0Kp9zwjXEI1lXQrf1H548WIxqbjW27G1bHldFnQp0nJj82tqourKVicuxnDORV
 tJQk0iC7cUq6eT0EDZChAHsEV0mATr02hC3gPCe/Hroiz8OossUxpwPvwrKtF3dp908p
 9WNz1hBISgAB3ckqK7quj/ULTpxXPu47v0RRRImG9U0edH28nyvBmY3VFGZwC5Rmkv/S
 vffyPiuH6pf2Ic8XWahxqFICGG4zHMm5piOirDyLkvdv22+cZuXVZgulPMeF+Qa7U1og
 K7Cw==
X-Gm-Message-State: APjAAAUZt0iiFeAlgQEDmBR8gHFrf4luEh51bJDgwg0JWo5kBgiEbBrt
 CYWcoVsyYMjXWSw9Ta5La+7FyXE7PjhgEqg2Dwqa/Q==
X-Google-Smtp-Source: APXvYqyhLjussJkVl3P+6EscMr246aR632XkoKBPYsv2hiOYLYpkUl/DfqIJgVg6/FL8Akw4vsr8fL18LoxHLsFB2/4=
X-Received: by 2002:aca:5588:: with SMTP id j130mr1775986oib.122.1576597600428; 
 Tue, 17 Dec 2019 07:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20191127091138.29223-1-patrice.chotard@st.com>
In-Reply-To: <20191127091138.29223-1-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 17 Dec 2019 08:46:29 -0700
Message-ID: <CAPnjgZ2kK+kSAxSQTF7sRJ3_rBti4+35uSU9hrXqbh=sEpcX+w@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Stephen Warren <swarren@nvidia.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
	alignment
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

Hi Patrice,

On Wed, 27 Nov 2019 at 02:11, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> In reserve_bootstage(), in case size is odd, gd->new_bootstage
> is not aligned. In bootstage_relocate(), the platform hangs when
> getting access to data->record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
>
> To insure that new_bootstage is 16 byte aligned (at least needed for
> x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> ALIGN_DOWN macro is used.
>
> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>

For this patch I think it would be better to update reserve_fdt() to
keep things aligned, assuming that is the problem.

At some point we should also document that reservations must keep
things aligned.

Perhaps this should be handled by a separate function called from all
these places, which subtracts gd->start_addr_sp and ensures 16-byte
alignment.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
