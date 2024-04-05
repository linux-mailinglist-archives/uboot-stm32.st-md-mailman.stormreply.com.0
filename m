Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B289C769
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A80FEC7128C;
	Mon,  8 Apr 2024 14:48:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B24BCC6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 14:43:01 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435EZo60021119; Fri, 5 Apr 2024 16:42:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:references
 :cc:from:in-reply-to; s=selector1; bh=RciFBkcRhPr+wyEeH+rR1LGu92
 zuq0Ev1V+g/jZXUIg=; b=VGPYZhRuiwxoEHoVxOk0mgbJyE0hpigA3LTH+artFy
 Zj3KFdeJhToFQW9XPCdNFcAfCbotAgcCQEuYNHfiq6YsdcftNjJHchnBB15JLVte
 Ho911GMBXqyPXKiXAQ+2laK7sWcDsZRNsQ/Q8H3uZTL1JZ+8jcWZDcUtAndbe4hJ
 kmeTGaQdog4pEISrsE0cEEacObyUzeog1FVTRHQX/n0ptjbg1noZcb7hCwSRO+ku
 YILRdPdGZSALbWhnsPQQ8Mkuag/YjHF7zRolzPrYPoBevDWOzQkfuKi+5Y+F5+rF
 3Lfh40dUveTUPwK5HfHzXmGslhl2L3VOKaKPkRzPhqHA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emng7m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 16:42:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6B2F040045;
 Fri,  5 Apr 2024 16:42:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E5822194F0;
 Fri,  5 Apr 2024 16:42:19 +0200 (CEST)
Received: from [10.252.15.227] (10.252.15.227) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 16:42:17 +0200
Message-ID: <5b827738-ee5d-4a1f-b671-8cf69927346c@foss.st.com>
Date: Fri, 5 Apr 2024 16:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD - foss <patrice.chotard@foss.st.com>, Marek Vasut
 <marex@denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-3-marex@denx.de>
 <f466f670-4c40-45ef-949b-a29a5ad83f99@foss.st.com>
 <DU2PR10MB7787E2D1BA7A4F471B403C2C8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787E2D1BA7A4F471B403C2C8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.252.15.227]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_14,2024-04-05_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:39 +0000
Cc: u-boot@dh-electronics.com, u-boot@lists.denx.de,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH 02/11] net: dwc_eth_qos: Rename
 eqos_stm32_config to eqos_stm32mp15_config
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
Content-Type: multipart/mixed; boundary="===============8566140902061524217=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============8566140902061524217==
Content-Type: multipart/alternative;
	boundary="------------rePDuLk7oz9rmDH3PiSG4FAX"
Content-Language: en-US

--------------rePDuLk7oz9rmDH3PiSG4FAX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> On 3/9/24 03:11, Marek Vasut wrote:
>> The current glue code is specific to STM32MP15xx, the upcoming
>> STM32MP13xx will introduce another entry specific to the STM32MP13xx.
>> Rename the current entry to eqos_stm32mp15_config in preparation for
>> STM32MP13xx addition. No functional change.
>>
>> Signed-off-by: Marek Vasut<marex@denx.de>
>> ---
>> Cc: Christophe Roullier<christophe.roullier@st.com>
>> Cc: Joe Hershberger<joe.hershberger@ni.com>
>> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
>> Cc: Ramon Fried<rfried.dev@gmail.com>
>> Cc:u-boot@dh-electronics.com
>> Cc:uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/net/dwc_eth_qos.c       | 2 +-
>>   drivers/net/dwc_eth_qos.h       | 2 +-
>>   drivers/net/dwc_eth_qos_stm32.c | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
>> index 533c2bf070b..203bfc0848c 100644
>> --- a/drivers/net/dwc_eth_qos.c
>> +++ b/drivers/net/dwc_eth_qos.c
>> @@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] = {
>> #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
>>        {
>>                .compatible = "st,stm32mp1-dwmac",
>> -             .data = (ulong)&eqos_stm32_config
>> +             .data = (ulong)&eqos_stm32mp15_config
>>        },
>>   #endif
>>   #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
>> diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
>> index a6087f191ab..bafd0d339fb 100644
>> --- a/drivers/net/dwc_eth_qos.h
>> +++ b/drivers/net/dwc_eth_qos.h
>> @@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);  extern
>> struct eqos_config eqos_imx_config;  extern struct eqos_config
>> eqos_rockchip_config;  extern struct eqos_config eqos_qcom_config;
>> -extern struct eqos_config eqos_stm32_config;
>> +extern struct eqos_config eqos_stm32mp15_config;
>>   extern struct eqos_config eqos_jh7110_config; diff --git
>> a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
>> index cfda757133e..fd29a604987 100644
>> --- a/drivers/net/dwc_eth_qos_stm32.c
>> +++ b/drivers/net/dwc_eth_qos_stm32.c
>> @@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops = {
>>        .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32  };
>>
>> -struct eqos_config __maybe_unused eqos_stm32_config = {
>> +struct eqos_config __maybe_unused eqos_stm32mp15_config = {
>>        .reg_access_always_ok = false,
>>        .mdio_wait = 10000,
>>        .swr_wait = 50,
> Reviewed-by: Christophe Roullier<christophe.roullier@foss.st.com>
>
--------------rePDuLk7oz9rmDH3PiSG4FAX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:DU2PR10MB7787E2D1BA7A4F471B403C2C8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM">
      <pre class="moz-quote-pre" wrap="">
On 3/9/24 03:11, Marek Vasut wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The current glue code is specific to STM32MP15xx, the upcoming
STM32MP13xx will introduce another entry specific to the STM32MP13xx.
Rename the current entry to eqos_stm32mp15_config in preparation for
STM32MP13xx addition. No functional change.

Signed-off-by: Marek Vasut <a class="moz-txt-link-rfc2396E" href="mailto:marex@denx.de">&lt;marex@denx.de&gt;</a>
---
Cc: Christophe Roullier <a class="moz-txt-link-rfc2396E" href="mailto:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>
Cc: Joe Hershberger <a class="moz-txt-link-rfc2396E" href="mailto:joe.hershberger@ni.com">&lt;joe.hershberger@ni.com&gt;</a>
Cc: Patrice Chotard <a class="moz-txt-link-rfc2396E" href="mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>
Cc: Patrick Delaunay <a class="moz-txt-link-rfc2396E" href="mailto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</a>
Cc: Ramon Fried <a class="moz-txt-link-rfc2396E" href="mailto:rfried.dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:u-boot@dh-electronics.com">u-boot@dh-electronics.com</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:uboot-stm32@st-md-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.com</a>
---
 drivers/net/dwc_eth_qos.c       | 2 +-
 drivers/net/dwc_eth_qos.h       | 2 +-
 drivers/net/dwc_eth_qos_stm32.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 533c2bf070b..203bfc0848c 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] = {
#if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
      {
              .compatible = "st,stm32mp1-dwmac",
-             .data = (ulong)&amp;eqos_stm32_config
+             .data = (ulong)&amp;eqos_stm32mp15_config
      },
 #endif
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
index a6087f191ab..bafd0d339fb 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);  extern
struct eqos_config eqos_imx_config;  extern struct eqos_config
eqos_rockchip_config;  extern struct eqos_config eqos_qcom_config;
-extern struct eqos_config eqos_stm32_config;
+extern struct eqos_config eqos_stm32mp15_config;
 extern struct eqos_config eqos_jh7110_config; diff --git
a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index cfda757133e..fd29a604987 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops = {
      .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32  };

-struct eqos_config __maybe_unused eqos_stm32_config = {
+struct eqos_config __maybe_unused eqos_stm32mp15_config = {
      .reg_access_always_ok = false,
      .mdio_wait = 10000,
      .swr_wait = 50,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Reviewed-by: Christophe Roullier <a class="moz-txt-link-rfc2396E" href="mailto:christophe.roullier@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a>

</pre>
    </blockquote>
  </body>
</html>

--------------rePDuLk7oz9rmDH3PiSG4FAX--

--===============8566140902061524217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8566140902061524217==--
