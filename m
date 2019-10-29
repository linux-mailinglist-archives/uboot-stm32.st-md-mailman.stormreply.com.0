Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30BE832C
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Oct 2019 09:24:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FD6DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Oct 2019 08:24:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D69C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 08:24:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9T8MWcS020143; Tue, 29 Oct 2019 09:24:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kHVuilUsa50FNStVwiK9cPYb4JkExnzggKPO6rdzxaw=;
 b=TAbcBlKeUaQ29M+8DyOSc/Q6u1ehzdannzfCqTIJC5K6aM0n0FXo0PO4zutUXqvF3HyS
 Xd+snkKbJtHPiAe2HAGj5Kw5TgMlCwOB9jh1pTFyzQDOn8WOl9NFGWjW4OcTnNeL2JkU
 JXp+sSPjXS0SvAtaKEefrjTjna7Q2m4E+o1pOwqB8ZPteRPLph4Nb7q4IBtdLTKU5vsM
 X/ar9XELN9KXD9qh9JzW5uOHAM0m6+qLajyozFPh+Xx+7zgP1Cb2so/7s8nDC+hKgos4
 d2xkPshTqemRdNtEjnrG9cb7RctdyTwlDpQuykLLStayXGUj0QvWVbIdpyodwjg1xh7s cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vvbww6c35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 09:24:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50519100034;
 Tue, 29 Oct 2019 09:24:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E7CE2AB5C6;
 Tue, 29 Oct 2019 09:24:28 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Oct
 2019 09:24:27 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 29 Oct 2019 09:24:27 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [U-Boot] [PATCH] cmd: remove NET and CMD_NET dependency for
 CMD_PXE
Thread-Index: AQHVjZLf5x7igjYXtkiDvahbFadG5qdwATQAgAE3cIA=
Date: Tue, 29 Oct 2019 08:24:27 +0000
Message-ID: <5f9e153f-eba4-928e-8830-e6420ef81011@st.com>
References: <20191028132319.21570-1-patrice.chotard@st.com>
 <20191028134946.GH11173@bill-the-cat>
In-Reply-To: <20191028134946.GH11173@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <EFE6BFE197E6B547AB58948BAC78FEE3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
Cc: Marek Vasut <marex@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] cmd: remove NET and CMD_NET
 dependency for CMD_PXE
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

On 10/28/19 2:49 PM, Tom Rini wrote:
> On Mon, Oct 28, 2019 at 02:23:19PM +0100, Patrice Chotard wrote:
>
>> It allows to use sysboot command on board which have no NET support.
>>
>> Currently, sysboot command can't be used if CMD_NET and NET flags are
>> not set, while sysboot allows to load extlinux.conf file from local
>> filesystem, so it doesn't need to depend of CMD_NET and NET flags.
>>
>> One solution would be to put sysboot command's code outside pxe.c and
>> create a new sysboot.c file. But sysboot command code is imbricated
>> with pxe command code and as all CMD_NET relative code is already under
>> CMD_NET flag, the easiest way to break sysboot dependency with CMD_NET
>> and NET flags is to move CMD_PXE outside CMD_NET and NET section in
>> Kconfig.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> How far did you go down the path of making cmd/sysboot.c or similar?
> Since it's not obvious unless you're already in here that the
> extlinux.conf stuff is inside pxe, it really would be good to split
> things out.  If you even have a rough draft patch to look at that would

As explained, this implementation was the easiest way ... but ok i will split out

sysboot code from pxe one, and put common code into a new file.

Thanks

Patrice


> be great.  Also:
>
>> ---
>>
>>  Kconfig     |  2 +-
>>  cmd/Kconfig | 12 ++++++------
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/Kconfig b/Kconfig
>> index 66b059f749..ce2ad16ea5 100644
>> --- a/Kconfig
>> +++ b/Kconfig
>> @@ -87,7 +87,7 @@ config DISTRO_DEFAULTS
>>  	select CMD_FS_GENERIC
>>  	select CMD_PART if PARTITIONS
>>  	select CMD_PING if CMD_NET
>> -	select CMD_PXE if NET
>> +	select CMD_PXE
>>  	select ENV_VARS_UBOOT_CONFIG
>>  	select HUSH_PARSER
>>  	select SUPPORT_RAW_INITRD
>> diff --git a/cmd/Kconfig b/cmd/Kconfig
>> index 07060c63a7..2cb0935632 100644
>> --- a/cmd/Kconfig
>> +++ b/cmd/Kconfig
>> @@ -1499,12 +1499,6 @@ config CMD_ETHSW
>>  	  operations such as enabling / disabling a port and
>>  	  viewing/maintaining the filtering database (FDB)
>>  
>> -config CMD_PXE
>> -	bool "pxe"
>> -	select MENU
>> -	help
>> -	  Boot image via network using PXE protocol
>> -
>>  config CMD_WOL
>>  	bool "wol"
>>  	help
>> @@ -1636,6 +1630,12 @@ config CMD_MISC
>>  	help
>>  	  Delay execution for some time
>>  
>> +config CMD_PXE
>> +	bool "pxe"
>> +	select MENU
>> +	help
>> +	  Boot image via network using PXE protocol or via local extlinux.conf file
>> +
> We should expand the prompt as well to note that sysboot is in here as
> well, if we cannot split.  Thanks!
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
