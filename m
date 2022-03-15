Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A74D95CB
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Mar 2022 08:58:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81D5DC60467;
	Tue, 15 Mar 2022 07:58:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 052F4C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 07:58:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4JIqd004832;
 Tue, 15 Mar 2022 08:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/POkWHyff2DoyZ0xERAR8FSB7oDVG7IpCoZjCZphm/0=;
 b=GvluPX+pWopobIY/ixDJzbICNHkADNPV9ZW/Is1pGC+qRqR2of+1qr5FmCIeEyNwL5R+
 die/JEujk8Ac2oNpaT1QiSaVK+GgC2Uv1sfrEdMl1pIHQgBU4dhoh7baU3fAmDA1KqSX
 sXyEv/25R6UYDVT2Q1e8hSrbFNY0vj0wHiy5n7XD1Y7lraLeGRE6iYT0jwI3BZ3nCiqV
 ian0cKWZworfiXNmPqpJyVAWlFb0E112kpU2whF3T0p7j0a3M9LWWEwohYZDJMG537TE
 D97PaW849VPmDvGomIkO7LNw0bi1Up82gs+xWlCof11zcmxMfvcRCdeb/g+Qok0FWo1u QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63hvq7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 08:58:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B4E1100045;
 Tue, 15 Mar 2022 08:58:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53BBA212308;
 Tue, 15 Mar 2022 08:58:01 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 15 Mar
 2022 08:58:00 +0100
Message-ID: <bf95561f-5af0-eeb7-e5db-9b24e621dd37@foss.st.com>
Date: Tue, 15 Mar 2022 08:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220201143716.1.I772b37f5f94142644b1fb45549e80239a8101263@changeid>
 <77274ad3-43f9-16c4-0d35-c6db573af1d8@foss.st.com>
In-Reply-To: <77274ad3-43f9-16c4-0d35-c6db573af1d8@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: st: common: update test on
 misc_read result in command stboard
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

Hi Patrick

On 2/23/22 08:43, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 2/1/22 14:37, Patrick Delaunay wrote:
>> Update management of misc_read/misc_write, which now returns length of
>> data after the commit 8729b1ae2cbd ("misc: Update read() and write()
>> methods to return bytes xfered"): raise a error when the result is not
>> the expected length.
>>
>> Fixes: 658fde8a36ff ("board: stm32mp1: stboard: lock the OTP after programming")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  board/st/common/cmd_stboard.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
>> index 2fba383168..c1ecd643b0 100644
>> --- a/board/st/common/cmd_stboard.c
>> +++ b/board/st/common/cmd_stboard.c
>> @@ -91,14 +91,14 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>>  	ret = misc_read(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>>  			&otp, sizeof(otp));
>>  
>> -	if (ret < 0) {
>> +	if (ret != sizeof(otp)) {
>>  		puts("OTP read error");
>>  		return CMD_RET_FAILURE;
>>  	}
>>  
>>  	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>>  			&lock, sizeof(lock));
>> -	if (ret < 0) {
>> +	if (ret != sizeof(lock)) {
>>  		puts("LOCK read error");
>>  		return CMD_RET_FAILURE;
>>  	}
>> @@ -172,7 +172,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>>  	ret = misc_write(dev, STM32_BSEC_OTP(BSEC_OTP_BOARD),
>>  			 &otp, sizeof(otp));
>>  
>> -	if (ret < 0) {
>> +	if (ret != sizeof(otp)) {
>>  		puts("BOARD programming error\n");
>>  		return CMD_RET_FAILURE;
>>  	}
>> @@ -181,7 +181,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>>  	otp = 1;
>>  	ret = misc_write(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>>  			 &otp, sizeof(otp));
>> -	if (ret < 0) {
>> +	if (ret != sizeof(otp)) {
>>  		puts("BOARD lock error\n");
>>  		return CMD_RET_FAILURE;
>>  	}
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
