Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A96B219AE3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jul 2020 10:33:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BFBFC36B2A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jul 2020 08:33:33 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7981EC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 08:33:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4B2TwC4HgXz1rvxn;
 Thu,  9 Jul 2020 10:33:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4B2TwC3bP0z1qr4k;
 Thu,  9 Jul 2020 10:33:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ckVvt8LNwe27; Thu,  9 Jul 2020 10:33:30 +0200 (CEST)
X-Auth-Info: OnKMOJLygV+a5UaGaAF0vugI6HKIQ02Dgn6rR9qdfYM=
Received: from [192.168.1.106] (91-82-251-60.pool.digikabel.hu [91.82.251.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  9 Jul 2020 10:33:30 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200706112653.18951-1-patrick.delaunay@st.com>
 <20200706112653.18951-2-patrick.delaunay@st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <383f3b88-43db-0029-bfde-c8ac7ce737d5@denx.de>
Date: Thu, 9 Jul 2020 10:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200706112653.18951-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] i2c: stm32f7: add stm32mp15 compatible
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Patrick,

Am 06.07.2020 um 13:26 schrieb Patrick Delaunay:
> Add a new compatible "st,stm32mp15-i2c" introduced in Linux kernel v5.8
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>   drivers/i2c/stm32f7_i2c.c | 1 +
>   1 file changed, 1 insertion(+)

Applied to u-boot-i2c.git master

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
