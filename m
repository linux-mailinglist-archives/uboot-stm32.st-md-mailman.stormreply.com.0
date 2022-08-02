Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E079587C8F
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 14:42:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7581C0D2C0;
	Tue,  2 Aug 2022 12:42:04 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E93AC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 12:42:03 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id b2so7032058vkg.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Aug 2022 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=baTog5BhIQkmXXSuE7D5vfoxEsZ0rQugy1Q3YmWgN9s=;
 b=MDYR3gEwiAFlo0iN0axaN1bERRVeLuaLAey3NkBAOCpxhxgio2ShWg6zzvZQgcLbhR
 56iPCC/w/3/OMOFr9m/OdR7bBsuGxkkyLG6UwsO5L1iaiiBgALUA7HRyv9quRcDnqKTR
 bCrrCYhLxtUgr0FlhokG90uMyW77nxvBwPUnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baTog5BhIQkmXXSuE7D5vfoxEsZ0rQugy1Q3YmWgN9s=;
 b=zHE/Z69B/Qj6JfThAdqwEDPNFEU5B1/O00qN/vSQx/jCoKlxxGwYa3rvUb2BYE77Hy
 u4MymBOMrwQusmL6Gr0UoD4p8aLOLps/AMVI6efZdBBIXrW/Y3IfVBgOu3LHTalAeB/X
 MBY/Bid2yha/KQRC8vWzkbII9+lHiW69XV6SN3TtGvu/slBRJZcrFH8+4E14jPSngNrY
 k9RObr9tsCKMC36msGqV42Q2KHDUPlNhvSvl6pprvdJjuXhanAqX8+OmfIWrLzlK+Fbj
 52tfaw/T1On5+7N5XmW0fLQzP2NXDQuOKSs+kzjx6dKQBVNiuohjn5EbTJRtxXJ3iiPP
 TdiQ==
X-Gm-Message-State: AJIora8gJtSr82QqR6zxaZ4c3L3FW8rRE8YQvljnojRpxBBju92tFqGy
 oFe0mjg4d44K77G7NbKsiMn8BI8ib18ausKvw3kY8g==
X-Google-Smtp-Source: AGRyM1tcbWBhDJ+Olzfzaj80aVIJJ0+CIPhNA+kG+OwsBLNEQTszUSdOPIh2rMYryqCzl2QctkQjr6ozMvIH1aMVTFg=
X-Received: by 2002:a1f:c687:0:b0:374:9549:741b with SMTP id
 w129-20020a1fc687000000b003749549741bmr7810751vkf.16.1659444121986; Tue, 02
 Aug 2022 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
 <20220802090910.277343-3-patrice.chotard@foss.st.com>
In-Reply-To: <20220802090910.277343-3-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Aug 2022 06:41:45 -0600
Message-ID: <CAPnjgZ1jTyLZdCFYKu1U64TdqRucWu_o5Jb8hr_4Oyf+7OHRTg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Eddie James <eajames@linux.ibm.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] gpio: Fix pin's status display for
 pin with GPIOF_UNUSED function
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

On Tue, 2 Aug 2022 at 03:09, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Even pin with GPIOF_UNUSED function can have a label.
> The criteria to add or not a space character is linked to label not to
> the used/unused status.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  drivers/gpio/gpio-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
