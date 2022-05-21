Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201652F758
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 May 2022 03:33:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319A3C03FDE;
	Sat, 21 May 2022 01:33:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A119C03FDE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 01:33:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ABFB880FC2;
 Sat, 21 May 2022 03:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653096810;
 bh=HFT/ZFU7XqI0hY/9MxUowBwvdpppH6t+GI75Zy38fZk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V7kVfPt4pz1XjmhDBGqcb3EbWCQPbEtxOOeZjKa9eai8jljo8k3hZo/QvaugA+cJI
 U56Jj5aOSjQjlXh7x93nOU3ZuWM4FVGLdZj3E8lJytO7OTuMmfSI2jDBp7U3r53z5C
 EdMNRlG1yQ8aB2d4yJxv8QU8fI4R8o0fKSLxaCsYafxdS4q669czjkpy9sY7g+GmeV
 cs8OpuHIfS2l/9L48PI1h1462SxRRqdM1PPoeM0PWFPb7QagACasfzCHbua3Lbilk8
 gZwFBOBc2TYrJ9dLFd3Qb2Qzo/wQ0QrrgairXDniU2ieAUNybv3Xu38W3D19lx/Pj0
 hK2CxJw+t+I1w==
Message-ID: <1c3f2f83-7583-f5aa-d821-58572ea301b5@denx.de>
Date: Sat, 21 May 2022 03:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220519184552.RFC.1.I4f6455f026820524103f7fbdffaafd3b75585197@changeid>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [RFC PATCH 1/2] board: dhelectronics: stm32mp1:
 convert to livetree
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 5/19/22 18:46, Patrick Delaunay wrote:
> Replace call to fdt_*() functions and access to gd->fdt_blob
> with call to ofnode_*() functions to support a live tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

I see your point regarding the speed up, wow.

Tested-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
