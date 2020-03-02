Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A817643A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 20:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E05BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 19:47:25 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E8DBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 19:47:24 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y17so551635lfe.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2020 11:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqrx1qb9ZmO8T/0KXV+w77E9YbveS5hnv4OygHHD4eo=;
 b=Bv4XrQAvPDT4++AannAMhRflbJSG+rHbDuHDXl3nyJFIU5RByZp9OdblaEVX0Muw3d
 HXGTyg80lpJmDMwrc/UUxmGg1rmdxIBEX3PMOfrmcHZohb4eYSuOEPLInIZBDy1ggFyp
 +nFKPU/7oguZHxtg+SHoRuiKndDfaaCO1CDlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqrx1qb9ZmO8T/0KXV+w77E9YbveS5hnv4OygHHD4eo=;
 b=X9cPPaekr1Gfyyi9dgzCIrBp/ThUJpTxgdnWp0BQPFgosbKzoUWnGkfuWT7SVFD9Wj
 uMTzuIDapo0HSPD8Dl50zsR+oPzTDhVmmc/t+vVd3i4/ifCwP6GCR/Q+B9ugk+wcXm6u
 jo5ZAL5AF7CeRIRjRu9WLYeMUWixtt5RyzZrjSO2lYo5tAxS5oJGOog0pYfBfKMXMLVb
 MbVp2ebVM8XgicdqRxTpo9uNCvsqnt02Augxc+4Lp0jWWdLca+yiwFZafbsTgyytg5Ke
 KucKDu/ocgQzJYBiJLSe6qilO/4UQzW3WwJaphEHX1u50fRq9SI0bifEPCeZlWRvbSvK
 SGIA==
X-Gm-Message-State: ANhLgQ2JFblRKlPoYF56IFbu/GVcC2KuT8cNHOfkV10uy+zUQH+z8lfc
 XQk2Lw/NJdqrsDDumpxUS7AQe+S1AdGz3Cksn+hU+g==
X-Google-Smtp-Source: ADFU+vs0sH59YiIwrvtw06c28gLVvmp2Nh9ddPGvRC8TrCs3rzT3WEHBpWWWH2G8i8TVNF7EXVcjQimAkLhAApxuswI=
X-Received: by 2002:ac2:568a:: with SMTP id 10mr398470lfr.123.1583178443324;
 Mon, 02 Mar 2020 11:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-3-patrick.delaunay@st.com>
In-Reply-To: <20200228141816.1644-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 2 Mar 2020 12:47:03 -0700
Message-ID: <CAPnjgZ11+q4oHA3vVkUL4YuH3UZ2U6nWb=s3P6uXGtTDQ2DcxA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Stefan Roese <sr@denx.de>,
 Adam Ford <aford173@gmail.com>, Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Subject: Re: [Uboot-stm32] [PATCH 2/7] Kconfig: update reference to
	README.x86
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

On Fri, 28 Feb 2020 at 07:18, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update reference in Kconfig detected by
> scripts/documentation-file-ref-check
>
> README.x86 => doc/arch/x86.rst
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
