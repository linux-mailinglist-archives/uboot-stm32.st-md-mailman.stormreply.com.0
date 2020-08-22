Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C124EA5B
	for <lists+uboot-stm32@lfdr.de>; Sun, 23 Aug 2020 01:18:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 127AAC3FAD8
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Aug 2020 23:18:16 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBC6C3FAD3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 23:18:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b17so4398173wru.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Aug 2020 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=ASV0Koj15HlQH+399QPjz5bpOmBjMBj81OV+4jiS+aE=;
 b=cmDxx4CaspvpMsJHAuOzLoDMkRT2tilVWzVdPA/27iwwE5EBf1iBM/0eavUAFsWu7j
 5zhjv9YDGBuLRyYsI84IC7swf/vJ/Je9aD8JornM/e9FiFF1te0aUa+xGJSQTRwmkog0
 jDGxO4I5MZgZUPliqxqaxCLqWYqe/mKQlhdyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=ASV0Koj15HlQH+399QPjz5bpOmBjMBj81OV+4jiS+aE=;
 b=TJ6aNwdXtyliA9K6Fr7XnJamSFnIYt2G+PoyqZWuu0Kj0C2Avw8NKwRy/fFhI8LQlz
 +b75di061nH61MTxhz4e4IpOWqBl8k/8DlbUYkZi/26ME1PqDv/prntNc7z2rmIenkaI
 7rxpEbqcKFQFQJcjsHN6d1yTuloB1b3NclZIOFnkltNcXqvpcTOAB2iELmW4CbfxrowN
 xmcO9JO4n6sIMehewo7RCZxtwVwWBaIbBWNHbumFFwLW+Qr3kCiZgqdo9u3YQPuMZt/9
 i7gBH1ikTmTHUQhFiNzx9PENw9LukJ7gRx8pkqkznDLaS58D7/JdCm4m+DxRiZlhdCPq
 3/nA==
X-Gm-Message-State: AOAM530pQlg7wM7ceRdIfLb5eCHV2olR7NZyM0IpYJVhZ8sVVGEfmj8A
 ZWegjS62OAxwCdyI/zNJSOAx2GxtzMitts8wf7TwBg==
X-Google-Smtp-Source: ABdhPJxMGxnEyqmyLEFDgKvzbT31ruzDas6oln7pi6LwqlmGtaskz+/9qVMh3PMu7waiFRZZlFgW3uHhcq1GfTEtP94=
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr8479384wrs.221.1598138294617; 
 Sat, 22 Aug 2020 16:18:14 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2020 19:18:09 -0400
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ1C5uWuLL7V75Vfbn=Kx2avhRN9hJgrUnNQxSBdZHcY3Q@mail.gmail.com>
References: <CAPnjgZ1C5uWuLL7V75Vfbn=Kx2avhRN9hJgrUnNQxSBdZHcY3Q@mail.gmail.com>
 <20200728071335.5840-1-patrice.chotard@st.com>
 <20200728071335.5840-4-patrice.chotard@st.com>
Date: Sat, 22 Aug 2020 19:18:09 -0400
X-Google-Sender-Auth: idmSrLnUiExmBGL9VnZvI4AjSXU
Message-ID: <CAPnjgZ1EgHga1NJzmgU_dnbys+HBVMqQYMqvPowuw-8GGVHpng@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Schocher <hs@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Walter Lozano <walter.lozano@collabora.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 3/5] sandbox: dts: Add compatible
	string for bind-test node
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

On Tue, 28 Jul 2020 at 01:13, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Usage of lists_bind_fdt() in bind command imposes to add
> a compatible string for bind-test node.
>
> Others impacts are:
>   - bind-test node is binded at sandbox start, so no need to bind it
>     in test_bind_unbind_with_node() test.
>   - As explained just above, after sandbox start, now a phy exist.
>     In test/dm/phy.c, it was verified that a third phy didn't exist,
>     now we must verified that a fourth phy doesn't exist.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>
> ---
>
> Changes in v5:
>   - rebase on last master
>   - fix phy test regression
>
>  arch/sandbox/dts/test.dts  | 1 +
>  test/dm/phy.c              | 2 +-
>  test/py/tests/test_bind.py | 3 ---
>  3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
