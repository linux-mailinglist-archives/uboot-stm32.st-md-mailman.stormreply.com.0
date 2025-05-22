Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5494AC047D
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 May 2025 08:19:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D2D6C7A825;
	Thu, 22 May 2025 06:19:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C6FBC78F95
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 06:19:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LJ7YMn006523;
 Thu, 22 May 2025 08:18:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 X33IDn/pxTWB5/Sq2/ZfR58QiksNcqaCq+HKzwRzfIg=; b=LxU1iHUY3ezY2zRy
 26rwRMbrX9jUSlbAJhdYwMgVB477czXOjddIsFLpW9SmsFy0EMLh9E7Wn0WouBgR
 d/isQGYTfF3M+0glsWLz0RJ3RQ3bktvKN2vpOEVAq1UV5KADERSb9q2bAC3pxzto
 pP7WI26l/dXIWKWsHxQfsdQL1K5EBIk3qKmIentjjrbEuWuknLiGzAGIV+z9CIbw
 oOsgbANlelTSRNTyqBQfg190E7+g72hIFhpI56m/QYexgmJ3ypNYrDeADwB/W04C
 1Ulf+m1QD5sbI0KDmhWTrJNFS+QLjxwTOQuGOH9UInyrFWo/dprZStwYEUzW/WtF
 W0lhdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfqq4b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 08:18:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 821DB40049;
 Thu, 22 May 2025 08:17:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF6C0B231F9;
 Thu, 22 May 2025 08:17:20 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 08:17:20 +0200
Message-ID: <ed9d8855-ad56-4dc0-b867-b586cce45cb1@foss.st.com>
Date: Thu, 22 May 2025 08:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250519090421.470942-1-patrick.delaunay@foss.st.com>
 <20250519110417.3.Iba2791fee8410d60ed4d60a7850521e29ba23a57@changeid>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250519110417.3.Iba2791fee8410d60ed4d60a7850521e29ba23a57@changeid>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 jerome.forissier@linaro.org, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Simon Glass <sjg@chromium.org>, ilias.apalodimas@linaro.org,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] test/py: tests: gpt: add
	test_gpt_write_part_type
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



On 5/19/25 11:04, Patrick Delaunay wrote:
> Add sandbox test on gpt command with partition type for known type.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  test/py/tests/test_gpt.py | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/test/py/tests/test_gpt.py b/test/py/tests/test_gpt.py
> index cfc8f1319a9b..e6d8792ac1fc 100644
> --- a/test/py/tests/test_gpt.py
> +++ b/test/py/tests/test_gpt.py
> @@ -330,6 +330,33 @@ def test_gpt_write(state_disk_image, ubman):
>      output = ubman.run_command('gpt guid host 0')
>      assert '375a56f7-d6c9-4e81-b5f0-09d41ca89efe' in output
>  
> +@pytest.mark.boardspec('sandbox')
> +@pytest.mark.buildconfigspec('cmd_gpt')
> +@pytest.mark.buildconfigspec('cmd_part')
> +@pytest.mark.buildconfigspec('partition_type_guid')
> +@pytest.mark.requiredtool('sgdisk')
> +def test_gpt_write_part_type(state_disk_image, ubman):
> +    """Test the gpt command with part type uuid."""
> +
> +    output = ubman.run_command('gpt write host 0 "name=part1,type=data,size=1M;name=part2,size=512K,type=system;name=part3,size=65536,type=u-boot-env;name=part4,size=65536,type=375a56f7-d6c9-4e81-b5f0-09d41ca89efe;name=part5,size=-,type=linux"')
> +    assert 'Writing GPT: success!' in output
> +    output = ubman.run_command('part list host 0')
> +    assert '1\t0x00000022\t0x00000821\t"part1"' in output
> +    assert 'ebd0a0a2-b9e5-4433-87c0-68b6b72699c7' in output
> +    assert '(data)' in output
> +    assert '2\t0x00000822\t0x00000c21\t"part2"' in output
> +    assert 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b' in output
> +    assert '(EFI System Partition)' in output
> +    assert '3\t0x00000c22\t0x00000ca1\t"part3"' in output
> +    assert '3de21764-95bd-54bd-a5c3-4abe786f38a8' in output
> +    assert '(u-boot-env)' in output
> +    assert '4\t0x00000ca2\t0x00000d21\t"part4"' in output
> +    assert 'ebd0a0a2-b9e5-4433-87c0-68b6b72699c7' in output
> +    assert '(375a56f7-d6c9-4e81-b5f0-09d41ca89efe)' in output
> +    assert '5\t0x00000d22\t0x00001fde\t"part5"' in output
> +    assert '0fc63daf-8483-4772-8e79-3d69d8477de4' in output
> +    assert '(linux)' in output
> +
>  @pytest.mark.buildconfigspec('cmd_gpt')
>  @pytest.mark.buildconfigspec('cmd_gpt_rename')
>  @pytest.mark.buildconfigspec('cmd_part')

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
