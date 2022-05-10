Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 009ED521437
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 13:51:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC050C03FC0;
	Tue, 10 May 2022 11:51:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7723BC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 11:51:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A91Gpx000318;
 Tue, 10 May 2022 13:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BeTMV36yOaSBou2pIXprBAccxSBLXEndeNWMr/+na0o=;
 b=2Lc9/5OaU+deWrVVQ/SjDjELOK0ImZ32FMcYFIfRJL5qdhQOblylgkwnMvm73X0bWjVO
 bD1v/+eOlsYVLUsSmeyglcbhlLdwiAwW8rY2uyAOGnLEw5/1BDZnbC+00/mHm9T9D6y2
 r1rmVAP/+D3gRMLoDbOVadbPI5BS6amCGTghRHx/+aHsesDH5urPn37i13Bwmqk2aVw5
 3H5VQUC4nxtL+5a4x/wX5vmw4nRMULKeTiu7wACnGTRt8vXllbpUgDNJQvrwMgrcnT4W
 hts9jWvhJaDOf5MJwUu+nKcGEwPbCkn2miAS6vji8bEuLO3+ktYPTK9GlV+pDXIl6v6S FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kr64g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 13:50:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8211E100034;
 Tue, 10 May 2022 13:50:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AAB321BF4B;
 Tue, 10 May 2022 13:50:58 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 13:50:58 +0200
Message-ID: <eef7ed55-ebe4-f7fa-3cff-1842aaee90ee@foss.st.com>
Date: Tue, 10 May 2022 13:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
 <ba65c436-1d9f-bce9-aa1d-cf8246ef6d46@foss.st.com>
 <35055a10-b07d-8478-c4ca-d98cb176c5f2@foss.st.com>
In-Reply-To: <35055a10-b07d-8478-c4ca-d98cb176c5f2@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-10_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] phy: stm32-usbphyc: add counter of
 PLL consumer
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



On 5/10/22 09:45, Patrice CHOTARD wrote:
> 
> 
> On 5/6/22 16:18, Patrice CHOTARD wrote:
>> Hi Patrick
>>
>> On 4/26/22 14:37, Patrick Delaunay wrote:
>>> Add the counter of the PLL user n_pll_cons managed by the 2 functions
>>> stm32_usbphyc_pll_enable / stm32_usbphyc_pll_disable.
>>>
>>> This counter allow to remove the function stm32_usbphyc_is_init
>>> and it is a preliminary step for ck_usbo_48m introduction.
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> ---
>>>
>>>  drivers/phy/phy-stm32-usbphyc.c | 76 +++++++++++++++++++++------------
>>>  1 file changed, 48 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
>>> index 9c1dcfae52..16c8799eca 100644
>>> --- a/drivers/phy/phy-stm32-usbphyc.c
>>> +++ b/drivers/phy/phy-stm32-usbphyc.c
>>> @@ -65,6 +65,7 @@ struct stm32_usbphyc {
>>>  		bool init;
>>>  		bool powered;
>>>  	} phys[MAX_PHYS];
>>> +	int n_pll_cons;
>>>  };
>>>  
>>>  static void stm32_usbphyc_get_pll_params(u32 clk_rate,
>>> @@ -124,18 +125,6 @@ static int stm32_usbphyc_pll_init(struct stm32_usbphyc *usbphyc)
>>>  	return 0;
>>>  }
>>>  
>>> -static bool stm32_usbphyc_is_init(struct stm32_usbphyc *usbphyc)
>>> -{
>>> -	int i;
>>> -
>>> -	for (i = 0; i < MAX_PHYS; i++) {
>>> -		if (usbphyc->phys[i].init)
>>> -			return true;
>>> -	}
>>> -
>>> -	return false;
>>> -}
>>> -
>>>  static bool stm32_usbphyc_is_powered(struct stm32_usbphyc *usbphyc)
>>>  {
>>>  	int i;
>>> @@ -148,18 +137,17 @@ static bool stm32_usbphyc_is_powered(struct stm32_usbphyc *usbphyc)
>>>  	return false;
>>>  }
>>>  
>>> -static int stm32_usbphyc_phy_init(struct phy *phy)
>>> +static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
>>>  {
>>> -	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
>>> -	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>>>  	bool pllen = readl(usbphyc->base + STM32_USBPHYC_PLL) & PLLEN ?
>>>  		     true : false;
>>>  	int ret;
>>>  
>>> -	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
>>> -	/* Check if one phy port has already configured the pll */
>>> -	if (pllen && stm32_usbphyc_is_init(usbphyc))
>>> -		goto initialized;
>>> +	/* Check if one consumer has already configured the pll */
>>> +	if (pllen && usbphyc->n_pll_cons) {
>>> +		usbphyc->n_pll_cons++;
>>> +		return 0;
>>> +	}
>>>  
>>>  	if (usbphyc->vdda1v1) {
>>>  		ret = regulator_set_enable(usbphyc->vdda1v1, true);
>>> @@ -190,23 +178,19 @@ static int stm32_usbphyc_phy_init(struct phy *phy)
>>>  	if (!(readl(usbphyc->base + STM32_USBPHYC_PLL) & PLLEN))
>>>  		return -EIO;
>>>  
>>> -initialized:
>>> -	usbphyc_phy->init = true;
>>> +	usbphyc->n_pll_cons++;
>>>  
>>>  	return 0;
>>>  }
>>>  
>>> -static int stm32_usbphyc_phy_exit(struct phy *phy)
>>> +static int stm32_usbphyc_pll_disable(struct stm32_usbphyc *usbphyc)
>>>  {
>>> -	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
>>> -	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>>>  	int ret;
>>>  
>>> -	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
>>> -	usbphyc_phy->init = false;
>>> +	usbphyc->n_pll_cons--;
>>>  
>>> -	/* Check if other phy port requires pllen */
>>> -	if (stm32_usbphyc_is_init(usbphyc))
>>> +	/* Check if other consumer requires pllen */
>>> +	if (usbphyc->n_pll_cons)
>>>  		return 0;
>>>  
>>>  	clrbits_le32(usbphyc->base + STM32_USBPHYC_PLL, PLLEN);
>>> @@ -235,6 +219,42 @@ static int stm32_usbphyc_phy_exit(struct phy *phy)
>>>  	return 0;
>>>  }
>>>  
>>> +static int stm32_usbphyc_phy_init(struct phy *phy)
>>> +{
>>> +	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
>>> +	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>>> +	int ret;
>>> +
>>> +	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
>>> +	if (usbphyc_phy->init)
>>> +		return 0;
>>> +
>>> +	ret = stm32_usbphyc_pll_enable(usbphyc);
>>> +	if (ret)
>>> +		return log_ret(ret);
>>> +
>>> +	usbphyc_phy->init = true;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int stm32_usbphyc_phy_exit(struct phy *phy)
>>> +{
>>> +	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
>>> +	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>>> +	int ret;
>>> +
>>> +	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
>>> +	if (!usbphyc_phy->init)
>>> +		return 0;
>>> +
>>> +	ret = stm32_usbphyc_pll_disable(usbphyc);
>>> +
>>> +	usbphyc_phy->init = false;
>>> +
>>> +	return log_ret(ret);
>>> +}
>>> +
>>>  static int stm32_usbphyc_phy_power_on(struct phy *phy)
>>>  {
>>>  	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> Patrice

After discussion with Patrick, the whole series will not be merged in stm32 git custodian master branch

Patrice

>> _______________________________________________
>> Uboot-stm32 mailing list
>> Uboot-stm32@st-md-mailman.stormreply.com
>> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> Applied to u-boot-stm32
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
