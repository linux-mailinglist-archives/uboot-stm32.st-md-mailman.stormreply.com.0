Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED452778BF
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Sep 2020 20:55:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53731C3FADF;
	Thu, 24 Sep 2020 18:55:09 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71997C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 18:55:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a9so127167wmm.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2G6Tmd8xl2E+ueM4UuHfBy2qGk3KaQ0avdTap8wLDMI=;
 b=YnucUZ1oxlSXhYbem1l2HoyfUSNCFLl1R3KqR3kFAQZsfU6l1N1mlejbRGg1Hb3qk5
 rq8OelQDe2kg2GnZnPZIUhNHWoKr/Cg/nDl6zQgliBbyAwnHnEZsgUBY7t3PijB1foFT
 RZ2bwTmtiVl3Xf1+WgQiP+zWGCe63eBB0Yfhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2G6Tmd8xl2E+ueM4UuHfBy2qGk3KaQ0avdTap8wLDMI=;
 b=lhaXQ2GGvX/hrfji4WZtXfosNV3bCX/J9aBCk/roP/lVvKntJlGf3RtDpI5Onn96Z4
 zWXIv7DvNvyns9C6Sdj7is7VZ2tRv/ql2N7KISIC9V9iwiUmBAltRwsDefc9LX7IFbHc
 kXUWbbFdZ5Gar1KwM3bP/BZHL0XqJsDOamvX0JpotGPnqyxB+xiBVR8DLJDC3WDav00q
 BIJ/pddZXf+ZS4vI2+ctW6qHLhN7M5OweJLWtKxEdMzoK278Fzx1wppa17w1XRrM6Vk1
 An4NFm1kovEhIQGLy8501cFJAW6bF+SXCV/YDXnwfnmICLM+sOvbs5XPhhwNyrA6YEWX
 tatA==
X-Gm-Message-State: AOAM532lOVaaZB4jHS2odQUfrEQOHrfv25iMIqz25tQe72Siq142KOgQ
 mz5vFTDNo+fnUVyHJNhcukUFnREpa0lz6uoHo6todw==
X-Google-Smtp-Source: ABdhPJyJbeUj5Ha41jWLbVkuNB9D7lysPp4WkTutqDEwnBXfRYQyTJTANRrMSiYIbJP0MHP0uR/tFMZecRq1+hxW14o=
X-Received: by 2002:a1c:8115:: with SMTP id c21mr64398wmd.153.1600973706788;
 Thu, 24 Sep 2020 11:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200924152621.1317-1-patrick.delaunay@st.com>
In-Reply-To: <20200924152621.1317-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Sep 2020 12:54:55 -0600
Message-ID: <CAPnjgZ2Bf1LxnrtXYvkqVQvbmFPdnSUNKOxm_D032nxUQJxdJQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dm: update test on of_offset in
	ofnode_valid
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

On Thu, 24 Sep 2020 at 09:26, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update the test for node.of_offset because an invalid offset is not
> always set to -1 because the return value of the libfdt functions are:
> + an error with a value < 0
> + a valid offset with value >=0
>
> For example, in ofnode_get_by_phandle() function, we have:
> node.of_offset = fdt_node_offset_by_phandle(gd->fdt_blob, phandle);
> and this function can return -FDT_ERR_BADPHANDLE (-6).
>
> Without this patch, the added test dm_test_ofnode_get_by_phandle failed.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  include/dm/ofnode.h |  2 +-
>  test/dm/ofnode.c    | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
