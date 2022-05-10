Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606A520F7E
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:10:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4920BC035BD;
	Tue, 10 May 2022 08:10:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 182D9C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:10:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7RQTE005875;
 Tue, 10 May 2022 10:10:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0B+j0RsmoW+RvgC9u2X3b7cfrwsn+RUr2wufAz1vcX0=;
 b=KQlYflOWZWfGFjJB00DCp60kIgNwMn1d/egje9JtaufRxD9XMLeChgYmN6lyIiCXV41b
 Wp0ectHRQuvAQIFG275RK7Nm/ZbMekNr7ZBzJLeLxrVvZr8AAbI1coQW07Iq/HPOhmDt
 KInEt6ZzGbLCasUFyMzk6eYxP5icRxCpMXRZmt/+cx8vPMY5FlU+qu843lSgTGViJKLB
 6ITIdCaWsv7veloXmgAlr9UZiNNX06H5S+3NsO1meKIWNgb73KDYy2Z1DNtBWlDKR2Ha
 1FdnTNnXinnBRf7FzgKFaPXwtdcwNCeSnhu9VOcN2hQgZDhvruuv7eGjG1sYeE0sN10h LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kpsuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:10:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCCF3100034;
 Tue, 10 May 2022 10:10:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B754E2132D4;
 Tue, 10 May 2022 10:10:39 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:10:39 +0200
Message-ID: <bd53472a-3406-954c-40db-0bc9ea7e9772@foss.st.com>
Date: Tue, 10 May 2022 10:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073900.15786-1-patrice.chotard@foss.st.com>
 <53a81962-1ef9-3796-cae7-8072afd6af4c@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <53a81962-1ef9-3796-cae7-8072afd6af4c@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: stm32-usbphyc: stm32-usbphyc: Add DT
 phy tuning support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA1LzYvMjIgMTA6NTAsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGkKPiAKPiBPbiA0
LzIyLzIyIDA5OjM5LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0IG9mIHBo
eS10dW5pbmcgcHJvcGVydGllcyBmb3Igc20zMi11c2JwaHljJ3MgcGh5IHR1bmluZwo+PiBhbGln
bmVkIHdpdGggdjUuMTUga2VybmVsIGJpbmRpbmdzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKg
IGRyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMgfCAxNjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspCj4+
Cj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IApBcHBsaWVkIHRvIHUtYm9vdC1z
dG0zMgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
