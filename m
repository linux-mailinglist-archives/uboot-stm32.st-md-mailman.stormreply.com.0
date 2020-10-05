Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91702284225
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 23:32:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1D7C32EA6;
	Mon,  5 Oct 2020 21:32:39 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94923C32EA5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 21:32:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t10so11200241wrv.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=rxuup/uzkPyOsOYFIUhxrxeBAjV+3c6O8EyLERxhgoc=;
 b=G89Q+5m22ACBb1fbdLkQC/IrN5wZJqAKtSyeuVq5dBbVbeB0IKKj9DAlkTMQdtqXiu
 F14Xa2J2I+9BbV7AsVdgRmhm9GigNw4l90WjGm7USrMBTZ+NfH00tU3YM+aiYZuluQC+
 hjZBOFhl3BuXpVLe9HcMfwpUlIVN4Jr1YUOVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=rxuup/uzkPyOsOYFIUhxrxeBAjV+3c6O8EyLERxhgoc=;
 b=hLRwGV1UDSBUrsX9LX6BjH1mr4FoyYK7/t8KxbqYfk+MVW7E1k8I/WZ6rsSJsLCzhT
 /qo2UraVURJyq06gAsaU1DELgKpUA+efkqNNisP4OeIa6YAgNZEQcXMG90F5zWstfNwj
 wQPRMQK1zYNA7luUq4UCyKHoHBJvAnXOx3inF2EFfjPUnMoy/TOAWRRFpVH+jwQj4j8Z
 PqSK5oMMwAokl24KebYqRA0gYa24gEcmy5z+gbSi1YfEghAxSQYK3NFTexjdYi66s5qG
 U3/9hEQ8IM7Q2z//ECTIa/eJY6lChOkGr5+FZoKPHAEsNx84fKD+ZVEDQgPM7y75fLzL
 tWXA==
X-Gm-Message-State: AOAM533YWptgZ3Ay2XAuCbN2C5NKar26td7+OVXbxCpqeH+YsKV2JO/7
 9VD2hmrweQfXjI71XVNESro84caJP/KguqOkZOk1dg==
X-Google-Smtp-Source: ABdhPJzUGLU3yC6gkAeoM2mQb2DMtyfZcWFAPuKlbTaOCGbBoJjLzW5Uz1jWZvGTx2TqF8aL8x2IpftdpDZvagDrexc=
X-Received: by 2002:a05:6000:10ce:: with SMTP id
 b14mr1475974wrx.204.1601933556958; 
 Mon, 05 Oct 2020 14:32:36 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Oct 2020 14:32:33 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ2Bf1LxnrtXYvkqVQvbmFPdnSUNKOxm_D032nxUQJxdJQ@mail.gmail.com>
References: <CAPnjgZ2Bf1LxnrtXYvkqVQvbmFPdnSUNKOxm_D032nxUQJxdJQ@mail.gmail.com>
 <20200924152621.1317-1-patrick.delaunay@st.com>
Date: Mon, 5 Oct 2020 14:32:33 -0700
X-Google-Sender-Auth: EYDYo_SxEpxlXX7c_Mtvt3QSI3A
Message-ID: <CAPnjgZ3p6x8Pd0dnZbSgWsoDquDHOk9FWTBc6QB0-mF_bOEw7w@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
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

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
