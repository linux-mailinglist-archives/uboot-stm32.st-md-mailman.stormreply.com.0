Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C454E72256C
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Jun 2023 14:20:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCF0C6A5E7;
	Mon,  5 Jun 2023 12:20:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C2F8C6905A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 12:20:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 355CG4bJ016235; Mon, 5 Jun 2023 14:20:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iuLOW5wYs6VOVGxkYt3KeCkQTPpHVRF5kWDUn01qhFs=;
 b=niQh4zACyv2KytW9lnV2oURR5h4jFtImQAruOEFLd7G4vTJtFmbK7+f0mHKzeEviC9f3
 6qN3hRHd4P8dWGPgf48gZCUvbckjU3M8OzRHxVJYbkklrodo14AyA6BnMiHGM8RfrsPd
 /CAvGZBdZqpiXWXHEdJtWMICkz/408QJ0uyipUVKGwLwNrFK5PnST+4Cf4X2XG4lknvd
 A46AXtWUtIvj4E101fk2Rfii9pdTgFWffjCasuQ9JOT9SG4m9JwwBhhhVynG/dsmhFlS
 w4rU+MJNVLFzqwFzgMrFrhjiF94vyE8oZz+ICNJkeV5Ko074tZCURvCt2K4Jd1JZ7Wvw cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r1c9s9fbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jun 2023 14:20:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B77110002A;
 Mon,  5 Jun 2023 14:20:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 733D0227EE0;
 Mon,  5 Jun 2023 14:20:10 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 5 Jun
 2023 14:20:10 +0200
Message-ID: <e4861387-3f04-9254-c3d2-3976f5a8dafc@foss.st.com>
Date: Mon, 5 Jun 2023 14:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
References: <20230601170602.2845768-1-dario.binacchi@amarulasolutions.com>
 <20230601171137.GY3755309@bill-the-cat>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230601171137.GY3755309@bill-the-cat>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: fix display pinmux for
	stm32f746-disco
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

Hi Tom

On 6/1/23 19:11, Tom Rini wrote:
> On Thu, Jun 01, 2023 at 07:06:02PM +0200, Dario Binacchi wrote:
>> As reported by the datasheet (DocID027590 Rev 4) for PG12:
>> - AF9  -> LCD_B4
>> - AF14 -> LCD_B1
>>
>> So replace AF14 with AF9 for PG12 in the dts.
>>
>> Fixes: fe63d3cfb77ef ("ARM: dts: stm32: Sync DT with v4.20 kernel for stm32f7")
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>
>> ---
>>
>>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> index 19b5451db441..522cffb1ac9f 100644
>> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
>> @@ -169,7 +169,7 @@
>>  	ltdc_pins: ltdc@0 {
>>  		pins {
>>  			pinmux = <STM32_PINMUX('E', 4, AF14)>, /* B0 */
>> -				 <STM32_PINMUX('G',12, AF14)>, /* B4 */
>> +				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
>>  				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
>>  				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
>>  				 <STM32_PINMUX('I',14, AF14)>, /* CLK */
> 
> Why is this whole stanza in a -u-boot.dtsi file and not an upstream
> file?
> 

LTDC entry has been put in stm32f746-disco-u-boot.dtsi by anticipation as described
in commit 01aabf97d1f0 ("ARM: dts: stm32: Migrate U-boot nodes to U-boot DT files for stm32f7")

So U-Boot DT will be synchronized with kernel one when Dario series will be available in kernel release.
The LTDC entry located in stm32f746-disco-u-boot.dtsi will be then removed.

Thanks
Patrice


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
