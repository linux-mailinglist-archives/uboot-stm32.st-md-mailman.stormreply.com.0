Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C343B36EDE2
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:10:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88495C58D5A;
	Thu, 29 Apr 2021 16:10:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB891C58D5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:10:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id m9so54756237wrx.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3uHx8n0NY2m6YzgLAjGw+8nEhFh69at3iq7f040zSuo=;
 b=fYE4Fxdu7I62PDfinYEOXVpTXSt4jvzCw9K2sMuX87CD+7RRX3hVslBNA49JxgehUt
 Jl6oiqlLJIK63XsNa+4139RZUwJj96jN/jcmFUpdQV1PhAdbnT/MSNZiywDOBOmCDCNI
 mD0/xaKWVy8rb42tPvFYwqvK37Pop41KAccWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uHx8n0NY2m6YzgLAjGw+8nEhFh69at3iq7f040zSuo=;
 b=OY3Bp13/Gq2gAmcyo1vJHitiRv4fPJG/4qculP6+e8Xi17KSzJfiS1dJ+wJJtm0Mmp
 bmJ1SVi7l3S5Fm39CGQeW2CMcYEn0tt+BzfbVPG1jWtddDi/74QtCl+Hhgu1881aOhBI
 Gz6IHVl4XPyox5qKnGohlRwhrbMAqXfLNJbJe11ha+8eC9obUO7x6l/P+D2XYjoyvZfK
 t9nTRORFbmy+kMYpHbc6uMVbhTFn8qON6KtmeJSc7vTa5Sr+7y0xBlEjEse2yuszHda/
 66MPvz8Vruq3148QeOvL6/VL0ZzAL6XTvlo/W6u7RFyH70tPawE7MZwQU4fgIg08bPLZ
 7ViA==
X-Gm-Message-State: AOAM530W1TI8LyjaSDum4Nu88fDB7Feii8h7LLo/5hpJABNr9s8dUFKV
 vfIWoLrOOhav/VDLLjRlRnO5D3nNk2uAz/lzTBumlRCwDO+bYQ==
X-Google-Smtp-Source: ABdhPJyHFP6Rzg2MxQ10QzAdB50U9Z8noV79sX23l3KJU/yRUfqTrwkYk/8vU9fBrVyD2XyP8M+qghDSgJEUd0nKsHM=
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr619227wrj.420.1619712619061; 
 Thu, 29 Apr 2021 09:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-6-patrice.chotard@foss.st.com>
In-Reply-To: <20210419094534.9748-6-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:06 -0700
Message-ID: <CAPnjgZ0wi4L1-i4ETQC8oHp45tC9y_AHFTnwnxq2HU-GSUKp7Q@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Walter Lozano <walter.lozano@collabora.com>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] test/py: Add usb gadget binding
	test
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

On Mon, 19 Apr 2021 at 02:58, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Add a specific usb gadget binding test which check that
> binding a driver without compatible string is working as expected.
>
> the command "bind /usb@1 usb_ether" should give the following "dm tree"
> command output:
>
> [...]
>  usb           0  [   ]   usb_sandbox           |-- usb@1
>  usb_hub       0  [   ]   usb_hub               |   |-- hub
>  usb_emul      0  [   ]   usb_sandbox_hub       |   |   `-- hub-emul
>  usb_emul      1  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@0
>  usb_emul      2  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@1
>  usb_emul      3  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@2
>  usb_emul      4  [   ]   usb_sandbox_keyb      |   |       `-- keyb@3
>  eth           4  [   ]   usb_ether             |   `-- usb@1
> [...]
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
>
> ---
>
> Changes in v2:
>   - add bind test
>
>  test/py/tests/test_bind.py | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
