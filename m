Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3413AC577
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:56:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C91C58D7A;
	Fri, 18 Jun 2021 07:56:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6806C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:56:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7rBPw014822; Fri, 18 Jun 2021 09:56:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YWRQAlHkrmGZ9SAYksttJm5AZZONrSf7hq0yXN1ZzhQ=;
 b=hlzaJKXPZNlfOJETEfcB1vkFhW7tjieFyH/4mpNGk/0O2sXoYrtFyP+2zh2wzdPCvEVF
 Her6sx3w3TvYvML8pdKmQTCeHy+5lwiddZpKjF/3xGLyJBQ+B0sB0b4aRMb/kreDpkPF
 vq7i/rGiSbuCJCDrCJaXqAGnltlomJZpvm96tszD1nVd5DFAy2QS0skzEf7z/w7bVMtE
 OCURqi5mWQahRv2qp+URhY56ScSRjwIupxYZbMaTQBTsmyaFze+jxYOHbalBMwZxvzBi
 YEh0YmkXraMI4LAALj3Z3gm7V6scdi3HcPeyEqPe6TD7j/s2+X+swFMjj293N6ugMnNu Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398eghts1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:56:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D721D10002A;
 Fri, 18 Jun 2021 09:56:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC51A2199B4;
 Fri, 18 Jun 2021 09:56:20 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:56:20 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.10.I77bcf66a0048289b8a5139cf59266a564d6400ac@changeid>
 <fbcfc378-4241-d413-c13f-c01661b5cd81@foss.st.com>
Message-ID: <9a421990-2071-4ca0-ad2b-b96132243359@foss.st.com>
Date: Fri, 18 Jun 2021 09:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fbcfc378-4241-d413-c13f-c01661b5cd81@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 10/10] stm32mp: stm32prog: handle dfu error
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

On 5/28/21 2:54 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 5/18/21 3:12 PM, Patrick Delaunay wrote:
>> Handle DFU stack error in STM32CubeProgrammer protocol.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index ab687c272d..f7c93a1298 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -1783,3 +1783,17 @@ void dfu_initiated_callback(struct dfu_entity *dfu)
>>  		log_debug("dfu offset = 0x%llx\n", dfu->offset);
>>  	}
>>  }
>> +
>> +void dfu_error_callback(struct dfu_entity *dfu, const char *msg)
>> +{
>> +	struct stm32prog_data *data = stm32prog_data;
>> +
>> +	if (!stm32prog_data)
>> +		return;
>> +
>> +	if (!stm32prog_data->cur_part)
>> +		return;
>> +
>> +	if (dfu->alt == stm32prog_data->cur_part->alt_id)
>> +		stm32prog_err(msg);
>> +}
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> 
Applied on u-boot-stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
