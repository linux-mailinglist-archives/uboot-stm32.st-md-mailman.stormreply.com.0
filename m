Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2235B6B1
	for <lists+uboot-stm32@lfdr.de>; Sun, 11 Apr 2021 21:11:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91832C32EA7;
	Sun, 11 Apr 2021 19:10:59 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96AE7C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Apr 2021 19:10:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FJM0F25QXz1s1VK;
 Sun, 11 Apr 2021 21:10:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FJM0F1GkPz1qqkL;
 Sun, 11 Apr 2021 21:10:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id L-XDq5ykOJJV; Sun, 11 Apr 2021 21:10:52 +0200 (CEST)
X-Auth-Info: pB1K5j6DhBI82GYWaSMAknGRqnjcFRdWqIgkHcALlUw=
Received: from crub (pd95f13e5.dip0.t-ipconnect.de [217.95.19.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 11 Apr 2021 21:10:52 +0200 (CEST)
Date: Sun, 11 Apr 2021 21:10:51 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210411211051.04ab2e54@crub>
In-Reply-To: <20210409180126.1.I120ba9a4276e42538cae6f1f1aac51221c63f6ad@changeid>
References: <20210409180126.1.I120ba9a4276e42538cae6f1f1aac51221c63f6ad@changeid>
MIME-Version: 1.0
Cc: Stephen Warren <swarren@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 u-boot@lists.denx.de, Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] board_f: cosmetic: change the debug trace
 to KB in reserve_video
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

On Fri, 9 Apr 2021 18:02:06 +0200
Patrick Delaunay patrick.delaunay@foss.st.com wrote:
...
> Fixes: 5630d2fbc50f3035 ("board: Show memory for frame buffers")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  common/board_f.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
