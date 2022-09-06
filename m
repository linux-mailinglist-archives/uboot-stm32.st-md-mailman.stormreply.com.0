Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B55AF837
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 01:03:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2AE4C63325;
	Tue,  6 Sep 2022 23:03:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DE52C63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 23:03:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 27C098498C;
 Wed,  7 Sep 2022 01:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662505423;
 bh=nONHR1gG9InRWrqF+usdZhammFfYshzT5b1L5W34OqM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n6vFl8kpeiHO/nG4JApp2K95jJP7TgPiWu884ZRDFiRV3ciNKz2RpBWnzDLgUhA7O
 OahCK+E6PmiktXL1s2fkCo9gFYP21lOmg2tj/yKZAAah83Sc7iJkx5TzGQgHY2w7mI
 e/VjMbbXnGRZ0YD5c03UgikqGi10kfktXW9CfIwc2Kpjr0G4E1UuqYbRbo/03NNzUW
 thbm+7FdTlHcdmifagnArgvbQBbsEaKraeQKmZDcq6kBR4xyCDqjZFvm0x7T3UQnhr
 IpCkZxsW1J3S2z+urmsP+0jwbl/5Wz2M3xuTSAEpe4ZFq1ViUEpiW8MdJCa4+YoxDg
 +frHP38DLCqlQ==
Message-ID: <b16b2fce-a72d-aa5f-a426-d445d0dc7cbb@denx.de>
Date: Wed, 7 Sep 2022 01:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 0/4] phy: Add generic_{setup,
	shutdown}_phy() helpers
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

On 9/6/22 08:15, Patrice Chotard wrote:
> 
> In drivers ehci-generic.c and ohci-generic.c, specific phy
> helpers has been added and shared 95% of common code.
> Factorize this code in generic_{setup,shutdown}_phy() helpers
> and update all consumers.

Entire series

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
