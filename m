Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED7D4C3A
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 04:53:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 979E8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 02:53:09 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB6BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Oct 2019 02:53:08 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 41so9588368oti.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 19:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=xVjOp1agcQSgwgS3GGU+ylzFWiMA8DgeIPbDzOvsZVw=;
 b=pgOKW9RXcmHwrBFX8KHdpJK9fVXqdzW1X8VQDXJqhMbi47lyjXzITgA/+rodJk35ex
 qEKFk9C2OQfCTqVDnY4d//YNVnlEmlsMElLZRSDp5c0obZJDD2M+4Vn8M5BTlUWYoVn7
 oF1DgS4YFu99bi9NLQ2zH0oJk0rB5jSJzTxqEEOsUIEwpHP9NdywiVtSlvKBy9kb8Qn4
 PrtCoa9stu5iw1km6rPcUSO3sx2QhXnQ4PWNolQE+plZmoF4bKVrzv4fBPUD6QRHydjr
 5UolRTlKiN9DcoZye4rfsDk5iMn6eC2gg+HtpeE45En/TQw9LqyzX+xq+VGWl/MZqgDz
 aqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=xVjOp1agcQSgwgS3GGU+ylzFWiMA8DgeIPbDzOvsZVw=;
 b=pLZN9ciBog8tfJoc6TSYaxTxIpTC77OjkNh9+k8JXpx714yX0wU6/LmWJ4D4qctnTz
 9zUW1cnP4PRFmHjJgsmmbGRjUK1bdH1KsWKmPB4oyEyPfG94VTitoAhCi+4vbEk55stT
 k3T8cqo64wasT5M487tpfYQMUv+vmWncLId3auR/kbsvqPWpPvCi+E3O67Q/vX+7h++w
 VXhp1G9PUaA96tMJyitY5GdyK+yxHgmHpAMepD+azdydHAo5y2IsvaAwY+VdoCIVdxWH
 yO3BTG+rXvUedZAwgSZLpk9bTvoV+DAqRS5eBnk4CvzIPhYc8wUPsG+mlUAQE24sflbu
 uVtQ==
X-Gm-Message-State: APjAAAXOfLLuWuZYAfXQBfeYyspMdcNBgdGm6wygqmgEq+B+TxqDhE1r
 HjVwg8PnTAk+I80sn/wx3ihWeHu+zkKCloVibWhHWQ==
X-Google-Smtp-Source: APXvYqwfUo0zFIH1hdkrIFyguU2BIlU2hhnamyHGQvMhBKsYhh+MtVzhwHQ7mSdZCbJZIt3ZpguR4votCsYN4B/cy5E=
X-Received: by 2002:a9d:5c07:: with SMTP id o7mr15550057otk.33.1570848786564; 
 Fri, 11 Oct 2019 19:53:06 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Oct 2019 22:53:04 -0400
MIME-Version: 1.0
From: sjg@google.com
In-Reply-To: <CAPnjgZ0H9hKQ0JWscT6a-4-NR+tRWdOCeUOq0fPcZ2_ZybzbDQ@mail.gmail.com>
References: <CAPnjgZ0H9hKQ0JWscT6a-4-NR+tRWdOCeUOq0fPcZ2_ZybzbDQ@mail.gmail.com>
 <20190930081913.17306-1-patrick.delaunay@st.com>
Date: Fri, 11 Oct 2019 22:53:04 -0400
X-Google-Sender-Auth: _pmB_CMBI3Wyv2Z68BklF1t1olY
Message-ID: <CAPnjgZ1VrfU0XRwmSSPcqvJ_5FnOExf_4JewOOYBmyKvryidZQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Tidy up dump output when there are
	many devices
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

On Mon, 30 Sep 2019 at 02:19, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> At present the 'Index' column of 'dm tree' assumes there is
> two digits, this patch increase it to 3 digits.
>
> It also aligns output of 'dm uclass', assuming the same 3 digits index.
>
> The boards with CONFIG_PINCTRL_FULL activated have one pinconfig
> by pin configuration, so they can have more than 100 devices
> pinconfig (for example with stm32mp157c-ev1 board we have
> 106 pinconfig node).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> ---

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
