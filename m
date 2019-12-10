Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA91184DC
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 11:21:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA55EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 10:21:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7180FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 10:21:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47XGLQ3zgwz1rpRf;
 Tue, 10 Dec 2019 11:21:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47XGLQ3MNcz1rjrG;
 Tue, 10 Dec 2019 11:21:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 9P30_bs3GgSC; Tue, 10 Dec 2019 11:21:16 +0100 (CET)
X-Auth-Info: K8IUMPcNEAfgJEbHJu+A00SyltD2LqFEd1US97pRUYA=
Received: from crub (p5483338F.dip0.t-ipconnect.de [84.131.51.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 10 Dec 2019 11:21:16 +0100 (CET)
Date: Tue, 10 Dec 2019 11:21:15 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191210112115.66407ba9@crub>
In-Reply-To: <20191120131116.20620-2-patrice.chotard@st.com>
References: <20191120131116.20620-1-patrice.chotard@st.com>
 <20191120131116.20620-2-patrice.chotard@st.com>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] video: bmp: Fix
	video_splash_align_axis()
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

On Wed, 20 Nov 2019 14:11:15 +0100
Patrice Chotard patrice.chotard@st.com wrote:
...
> Changes in v2:
>      - Convert panel_picture_delta from unsigned long to long
> 
>  drivers/video/video_bmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Also changed 'axis_alignment' to long and applied to u-boot-video/master,
thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
