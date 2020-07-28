Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3EF230F0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:18:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA8B5C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:18:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 229F9C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:18:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SGCPEH026393; Tue, 28 Jul 2020 18:17:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=T54oTSA18afUr6c21vj1vaf46KHVKZDMSQ/auwc3tAw=;
 b=h0/90yKsRUoxAQGFJTJOQB7DJP1HcU0TeHdyMWvrMYu3Zn5E4NUUO56B+1AsmOgIoCDu
 AC2TLaKhm5e/quFvyjBpFFJeLsZJKhWv+pgGp/vRVELw4u/AAFCkv6r37UA4ZH7lxmuX
 47LF8gtgPWti2FtDo20sHg3FSHVTdAZPtuDz9V8ZQBSWXZuS3kLa3znemiUPXFXq8/Xx
 xTveLqK7+5siUftp6c++lt17YWmBxvczuxzVIsG3+YDcjfd7+zPcl298cQAR4BI3jD/6
 PaHAOXH+fK0aAWapKp8+12ttcyBReAzT1PMnBv7a1vlgVPTteq+pAlYqGntfhxCLvsXT Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71y4er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:17:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76D7210002A;
 Tue, 28 Jul 2020 18:17:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 521722A613B;
 Tue, 28 Jul 2020 18:17:44 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:17:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:17:43 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v6] ARM: dts: stm32: add seeed studio odyssey-stm32mp157c
 board
Thread-Index: AQHWVcOit/pYYGqc/UyMrWOLSxn0JqkdKDCA
Date: Tue, 28 Jul 2020 16:17:43 +0000
Message-ID: <ba48a2ea-4f2c-1186-53ec-aa411f582dbe@st.com>
References: <20200708174906.41280-1-marcin.sloniewski@gmail.com>
 <20200708175622.42669-1-marcin.sloniewski@gmail.com>
 <7da64e599c28432693425bb4d2c4d66b@SFHDAG6NODE3.st.com>
In-Reply-To: <7da64e599c28432693425bb4d2c4d66b@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <B086515ACC56FA42B0904D4FFB0FDA36@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: Baruch Siach <baruch@tkos.co.il>, Josip Kelecic <josip.kelecic@sartura.hr>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v6] ARM: dts: stm32: add seeed studio
 odyssey-stm32mp157c board
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


On 7/9/20 9:35 AM, Patrick DELAUNAY wrote:
> Hi Marcin,
>
>> From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
>> Sent: mercredi 8 juillet 2020 19:56
>>
>> This commit adds device tree files supporting SBC from Seeed Studio based on
>> STM32MP157C.
>>
>> This works with generic stm32mp1 config.
>> Right now only booting from SD card is supported.
>>
>> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
>> ---
>>
>> Changes in v6:
>> - forgot to add changes in v5 ;(
>>
>> Changes in v5:
>> - removed description of PLL1 which is now handled by OPP info
>> - removed cd-gpio for sdmmc1 since it is not yet supported
>>
>> Changes in v4:
>> - removed unnecessary pull up on uart4 rx
>>
>> Changes in v3:
>> - changed name of dts files from odyssey-stm32mp157c...
>>   to stm32mp157c-odyssey...
>> - removed usbotg node config
>> - add new board in dts/Makefile in alphabetical order
>>
>> Changes in v2:
>> - removed `st,adc_usb_pd` from config since that
>>   adc connection is non-existent which caused
>>   warning or hang during boot
>>
>>  arch/arm/dts/Makefile                         |   1 +
>>  .../dts/stm32mp157c-odyssey-som-u-boot.dtsi   | 125 ++++++
>>  arch/arm/dts/stm32mp157c-odyssey-som.dtsi     | 364 ++++++++++++++++++
>>  arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi  |  58 +++
>>  arch/arm/dts/stm32mp157c-odyssey.dts          | 161 ++++++++
>>  5 files changed, 709 insertions(+)
>>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som-u-boot.dtsi
>>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-som.dtsi
>>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey-u-boot.dtsi
>>  create mode 100644 arch/arm/dts/stm32mp157c-odyssey.dts
>>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> Thanks
>
> Patrick
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
