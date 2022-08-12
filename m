Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E49DE5909E8
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Aug 2022 03:35:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AD89C04003;
	Fri, 12 Aug 2022 01:35:10 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA5FC03FDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 01:35:08 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-32269d60830so189797117b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=wXrlLu1P7AUdqYkPm2do4BoEN1vmweLwt9dj0COwv58=;
 b=K2L4GFXm1CYsHZ/4LRz69GOvRIiEA99UWoCswg1yylZi5aOyvYL6g/cqPnu5bAnf7U
 aFU0/NbuHNj6YI6d0qYX46nh2StKSFzboxTqkfY3yk46MoNgrH/SjlqGlnDSF8b1U7FF
 R0uBQszAERGXpkQ0/GybJwvoJWlSmOjRwGqs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=wXrlLu1P7AUdqYkPm2do4BoEN1vmweLwt9dj0COwv58=;
 b=PbhHecTJR+WZxboiiy9qAUxnZcb4dM50zNom8r0FjAr9kIF1nEVQ4lG5Gb9skqFwh4
 TuAgEi7yA3mFj0kkcEpnkIkU1HN2C/ntfpewH7OKWobyd8zweLdyo5JXQx29flcra5Va
 o0SzhBmRoYVYwfNy7NMudtOufXPPIzp7yKcwABgGCrrvDV2NZ5r7g2Y0hvA+AOIfHIBl
 FlMxgQzwLvMNth+p2vG1W+J7NCWQSMCaREPpahAuWTfY0TnN3AOtNCH5eSYHFvgZBXt6
 VaLV8nMnDB4EkTYV5QB4fBwZ+GQRUsVL3q/SVYJpiD7nCD4iGS12F6P8DBpRR1xYgbK8
 ndkg==
X-Gm-Message-State: ACgBeo0r8MQAa1A26DMkw1kiUy5DOIgTHmpwf72GExEUXwN4cK72hVl0
 2TuBl51U80IgIsb2k0rn5nItcbr3NMVNRzvoLCzfHA==
X-Google-Smtp-Source: AA6agR4pzmaeqAv6Z9wxP4rgjcb8DB0m09l0+HbgFgSZCOhwWahL/Q4DPk45crUwgWuTH+ifCstZb0Mvb3nf1alrkZM=
X-Received: by 2002:a0d:ea91:0:b0:31f:51a1:c855 with SMTP id
 t139-20020a0dea91000000b0031f51a1c855mr1821503ywe.423.1660268107196; Thu, 11
 Aug 2022 18:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220807154708.1418967-1-sjg@chromium.org>
 <20220807154708.1418967-24-sjg@chromium.org>
 <20220808013216.GC44816@laputa> <20220808020004.GD44816@laputa>
In-Reply-To: <20220808020004.GD44816@laputa>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Aug 2022 19:34:55 -0600
Message-ID: <CAPnjgZ3vuEg6OVMZSWRzo6i4m8ze08KXDxQ9kggSDiZMv_6vNA@mail.gmail.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Simon Glass <sjg@chromium.org>, 
 U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anastasiia Lukianenko <vicooodin@gmail.com>, 
 Aswath Govindraju <a-govindraju@ti.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, 
 Lukasz Majewski <lukma@denx.de>, Marek Vasut <marex@denx.de>, 
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Max Merchel <Max.Merchel@tq-group.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>, 
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Ricardo Salveti <ricardo@foundries.io>,
 Stefan Roese <sr@denx.de>, 
 "Ying-Chun Liu (PaulLiu)" <paul.liu@linaro.org>, schspa <schspa@gmail.com>, 
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 23/23] blk: Rename if_type to uclass_id
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

Hi Takahiro,

On Sun, 7 Aug 2022 at 20:00, AKASHI Takahiro <takahiro.akashi@linaro.org> wrote:
>
> On Mon, Aug 08, 2022 at 10:32:16AM +0900, AKASHI Takahiro wrote:
> > My comment below is not directly related to the change, but
>
> Another comment,
>

OK I did a patch for the first comment, but can I please leave you to
address the second one? It is a bit sideways to my series.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
