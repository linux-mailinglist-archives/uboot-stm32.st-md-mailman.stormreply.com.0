Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4E2AD78A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Nov 2020 14:33:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 158AEC35E2B;
	Tue, 10 Nov 2020 13:33:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAA16C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 13:33:12 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CVphl3dNvz1rs00;
 Tue, 10 Nov 2020 14:33:11 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CVphl33t5z1r56p;
 Tue, 10 Nov 2020 14:33:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZgfagpXdgzzm; Tue, 10 Nov 2020 14:33:10 +0100 (CET)
X-Auth-Info: 3crqjnnnuyD4uEeHGkZXUovGeGkpokueRalPl1ACK78=
Received: from [192.168.1.106] (87-97-28-94.pool.digikabel.hu [87.97.28.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 10 Nov 2020 14:33:10 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
 <20201106180201.31784-23-patrick.delaunay@st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <940046f1-1578-f511-01eb-d91466e18316@denx.de>
Date: Tue, 10 Nov 2020 14:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201106180201.31784-23-patrick.delaunay@st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 22/33] i2c: stm32f7_i2c: migrate trace
 to dev and log macro
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

Am 06.11.2020 um 19:01 schrieb Patrick Delaunay:
> Change debug to dev_dbg macro and define LOG_CATEGORY.
> 
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
> (no changes since v1)
> 
>   drivers/i2c/stm32f7_i2c.c | 74 +++++++++++++++++++--------------------
>   1 file changed, 37 insertions(+), 37 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

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
