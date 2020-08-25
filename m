Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216C2515C9
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 11:56:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FC97C32EA7
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 09:56:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EB87C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 09:56:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07P9hPDt000812; Tue, 25 Aug 2020 11:56:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cxWp/92N7RZxfq2dvCg22W5zJ8kl9a/ytQA6gM5/ZUA=;
 b=03b0P/l3fDulStftos8T9A3cdymgI02dOd7OVJV/m4f4nApy5014nDij11rLA43oy0Nt
 WlmHgIHyij0y8PcUqTTm6CZBYxLbvBbzaSEUvI2snhZnatt4Iz7Cm41oNSpBWOHyiQRz
 +5wPtGwlqMWSSDg3OiGiI5BOEjnt4ucTLJ9EI24yxVXNL1GA2JWXidsbvtio3hmdOhDC
 lyUACAZP8CWfMFwY62/a7EK3yYum2io8539OJ9L1+p+S1VoH9dkXTkadnhdzIxijy/sS
 Ub/x8Y8g8nJTFGVnbncuBHnKHSlajUtQfm7+ZjpCAbArP2Pv6qrje8kj4bjIXhjfMKWx Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b2mj9jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 11:56:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06D6010002A;
 Tue, 25 Aug 2020 11:56:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 833F62A5E2A;
 Tue, 25 Aug 2020 11:56:12 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 11:56:12 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Aug 2020 11:56:12 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 1/2] fdtdec: optionally add property no-map to created
 reserved memory node
Thread-Index: AQHWcVa6qsVePOMqiEWw0N7uOlHL1qlEKEoAgARfagA=
Date: Tue, 25 Aug 2020 09:56:12 +0000
Message-ID: <ab037f28-5035-5179-aecf-8beb10e34a06@st.com>
References: <20200813114650.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
 <CAPnjgZ3X01MMnhNCZ9+XpS6BTasmcKZ4RUGE5wLdevut1DO5Gw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3X01MMnhNCZ9+XpS6BTasmcKZ4RUGE5wLdevut1DO5Gw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <48054038C58D6843BDA58BF1F65700A6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-24,
 2020-08-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Etienne CARRIERE <etienne.carriere@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] fdtdec: optionally add property
 no-map to created reserved memory node
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

Hi Simon

On 8/22/20 5:09 PM, Simon Glass wrote:
> On Thu, 13 Aug 2020 at 03:47, Patrice Chotard <patrice.chotard@st.com> wrote:
>> From: Etienne Carriere <etienne.carriere@st.com>
>>
>> Add boolean input argument @no_map to helper function
>> fdtdec_add_reserved_memory() to add "no-map" property for an added
>> reserved memory node. This is needed for example when the reserved
>> memory relates to secure memory that the dear Linux kernel shall
>> not even map unless what non-secure world speculative accesses of the
>> CPU can violate the memory firmware configuration.
>>
>> No function change. A later change will update to OPTEE library to
>> add no-map property to OP-TEE reserved memory nodes.
>>
>> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>
>>  include/fdtdec.h  |  5 +++--
>>  lib/fdtdec.c      | 10 ++++++++--
>>  lib/optee/optee.c |  2 +-
>>  3 files changed, 12 insertions(+), 5 deletions(-)
> Please can you check this as it seems to have a build error.

Yes, sorry, we forgot to update dm test and other platform piece of code.

A v2 will be send.

Thanks

Patrice


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
