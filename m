Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF34189853
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:46:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EEC8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:46:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E13DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:46:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9fcL5019097; Wed, 18 Mar 2020 10:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8/IXglVlF4zNYMqyDss8r60Zqwz8luIC6l84WYTdTlI=;
 b=p6Jy21uVbRd9ULD6bv4kh2Eri5VCd/6DoX1J78Hsu5NOWFbepsTdwdml0fGKcky6ynQ9
 R9BQBsWDLbupZgcuCBNUDeP1DzpN0CsXpYrpYUhD1igz/AwmfhpxiD3N+KhYZXsdeCAu
 472gkIZJW/3664tG9iAxli03E/uVhinW9R8yFbXfIQPc1TUAgUqLC8jyj7J5R7pyLlLX
 Ii1FJZb8PEdgX4nCATDSL4bB+6qXE9RcTlbnMGqdp8BJEjdOp4wCSHPxzA4RKhkG0/XS
 EW82R+v8D/ieJI0CQ8XoyyGyeIfqDYJu6jPZvSbZNfM2bdDCHKZ+TxgOBgqnKvugG3Pj vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etarm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:46:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40644100038;
 Wed, 18 Mar 2020 10:46:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 353E121E665;
 Wed, 18 Mar 2020 10:46:15 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:46:14 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:46:14 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 7/9] ram: stm32mp1_ddr: fix self refresh disable during
 DQS training
Thread-Index: AQHV86AJXE5uu4ogYEiZmyhO/zeg/6hOHBoA
Date: Wed, 18 Mar 2020 09:46:14 +0000
Message-ID: <9ed0f904-bb30-b5a2-864d-d74129949451@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.7.I0f31274f26e4299269ef3c7d5a581d2abe96aad2@changeid>
In-Reply-To: <20200306111355.7.I0f31274f26e4299269ef3c7d5a581d2abe96aad2@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <00B3533D7C41B74E97ACBDC99AB2D44F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/9] ram: stm32mp1_ddr: fix self refresh
 disable during DQS training
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> DDRCTRL_PWRCTL.SELFREF_EN needs to be reset before DQS training step, not
> to enter in self refresh mode during the execution of this phase.
> Depending on settings, it can be set after the DQS training.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_ddr.c      | 5 ++++-
>  drivers/ram/stm32mp1/stm32mp1_ddr_regs.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> index a87914f2d5..b9300dd6d1 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> @@ -639,7 +639,8 @@ void stm32mp1_refresh_disable(struct stm32mp1_ddrctl *ctl)
>  	start_sw_done(ctl);
>  	/* quasi-dynamic register update*/
>  	setbits_le32(&ctl->rfshctl3, DDRCTRL_RFSHCTL3_DIS_AUTO_REFRESH);
> -	clrbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN);
> +	clrbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN |
> +				   DDRCTRL_PWRCTL_SELFREF_EN);
>  	clrbits_le32(&ctl->dfimisc, DDRCTRL_DFIMISC_DFI_INIT_COMPLETE_EN);
>  	wait_sw_done_ack(ctl);
>  }
> @@ -652,6 +653,8 @@ void stm32mp1_refresh_restore(struct stm32mp1_ddrctl *ctl,
>  		clrbits_le32(&ctl->rfshctl3, DDRCTRL_RFSHCTL3_DIS_AUTO_REFRESH);
>  	if (pwrctl & DDRCTRL_PWRCTL_POWERDOWN_EN)
>  		setbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_POWERDOWN_EN);
> +	if ((pwrctl & DDRCTRL_PWRCTL_SELFREF_EN))
> +		setbits_le32(&ctl->pwrctl, DDRCTRL_PWRCTL_SELFREF_EN);
>  	setbits_le32(&ctl->dfimisc, DDRCTRL_DFIMISC_DFI_INIT_COMPLETE_EN);
>  	wait_sw_done_ack(ctl);
>  }
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> index 9d33186b3a..afd93c518e 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> @@ -260,6 +260,7 @@ struct stm32mp1_ddrphy {
>  
>  #define DDRCTRL_MRSTAT_MR_WR_BUSY		BIT(0)
>  
> +#define DDRCTRL_PWRCTL_SELFREF_EN		BIT(0)
>  #define DDRCTRL_PWRCTL_POWERDOWN_EN		BIT(1)
>  #define DDRCTRL_PWRCTL_SELFREF_SW		BIT(5)
>  

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
