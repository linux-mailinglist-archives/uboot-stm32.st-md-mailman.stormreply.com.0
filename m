Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D25F566F
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Oct 2022 16:31:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BB3CC63326;
	Wed,  5 Oct 2022 14:31:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 017C2C63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 14:31:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D86EE84E09;
 Wed,  5 Oct 2022 16:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664980302;
 bh=cDaBzIPHLyVnLTIcU7TKHXOM+abbgWUjtX0zjtwpySM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CuiLFztdyYIM/wy4Zs3qahMwqctvvUFfonMmWxW6do1+BoRTDpITJMTuSCkMjiASR
 u70Qo8EIrKQLZLibLqz9IUTgA2w3JYQoqiF5L6+x6apH8nrEq/UIQSyl/07u4WZnBO
 8M3HpMY+z0QSwqlHnDeqh4uqNmfIK0wdThx6yJGc3Lgsz0pgGNWxWKH8V+UHHSqNA4
 psDcv/VbuVxowVlGuMwcS8eSJY+B9lF+z/+16pcM06RKemiMuWQ6XMbCR+0n8wNY/S
 ZE+QGuUJa/QtcH14JZsiOAnTCWJoo8y6RdBuM+TGYJkObE5mEDeKOxPH3GsDhezCEi
 n7s6wPn+bbRsQ==
Message-ID: <533ea026-00b3-5dba-e42b-3369d60586d4@denx.de>
Date: Wed, 5 Oct 2022 16:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
 <b16b2fce-a72d-aa5f-a426-d445d0dc7cbb@denx.de>
 <49e332f0-afe7-59ba-675f-fcee80e651eb@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <49e332f0-afe7-59ba-675f-fcee80e651eb@foss.st.com>
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

On 10/4/22 08:43, Patrice CHOTARD wrote:
> Hi Marek
> 
> On 9/7/22 01:03, Marek Vasut wrote:
>> On 9/6/22 08:15, Patrice Chotard wrote:
>>>
>>> In drivers ehci-generic.c and ohci-generic.c, specific phy
>>> helpers has been added and shared 95% of common code.
>>> Factorize this code in generic_{setup,shutdown}_phy() helpers
>>> and update all consumers.
>>
>> Entire series
>>
>> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> Just a gentle reminder as you have reviewed this series, but it has not been merged into next branch.

Applied to usb/master, thanks.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
