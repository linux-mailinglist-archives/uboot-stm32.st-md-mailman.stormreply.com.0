Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 024493AC591
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:59:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0DE9C597B0;
	Fri, 18 Jun 2021 07:59:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B338C597AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:59:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7uaS4028760; Fri, 18 Jun 2021 09:59:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lHBcujghi8+JS4222dD9SL5TC1yEUdrccRe1G47/V00=;
 b=QGKXnmfEDNq9Valbqil4zoBsS4LO5VNvPqNZIj696s/Htpy6WNUHRDQ0itSNS+qTITp+
 3xFNGlg78q3oBYRwfKE1pAUYbccCg26qcgewqZEVIlFz9N/2FgYvlzsWJnMzM9Rfr82A
 3id34g0Ft/unb8Uf5hWV6UN790K/V0gyEf9Xng4QNw022iNQ9eZjdXzgpeKEoBmE3mIP
 zqbgEcDwWtScMI+Njctd7khOyWXZF+obvARBX7lqWL3CgPNVHelBuKbXsc9yeqRkn6ei
 gfkE6hYl8Ms5txPr3tfCEtww3nIGX/2oTQpbYhuK9xF20YP9j2373XJSf930XbqR6nIF ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398hn39sc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:59:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15EC8100034;
 Fri, 18 Jun 2021 09:59:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A32B21A20A;
 Fri, 18 Jun 2021 09:59:37 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:59:36 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <181587e59f14987c730d5a0c573407de1c59b511.1622651232.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b37cb3cb-e4d9-a659-f311-6ed6e99e043e@foss.st.com>
Date: Fri, 18 Jun 2021 09:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <181587e59f14987c730d5a0c573407de1c59b511.1622651232.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 2/5] arm: dts: stm32mp157c-odyssey-som:
 enable all SDMMC2 data lanes
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

CgpPbiA2LzIvMjEgNzowOSBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3RlOgo+IEFkZCB0aGUg
4oCcc2RtbWMyX2Q0N19waW5zX2TigJ0gcGlucyB0byB0aGUgU0RNTUMyIHBpbmN0cmxzLiBJbmNy
ZWFzZSB0aGUKPiBidXMgd2lkdGggZnJvbSBmb3VyIHRvIGVpZ2h0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KPiBDYzogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdHJp
Y2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+IENoYW5nZXMg
Zm9yIHYyOgo+ICAgIC0gcmViYXNlZCBvbiBjdXJyZW50IG1hc3RlciAocGF0Y2ggbm90IGNoYW5n
ZWQpCj4gICAgLSBhZGRlZCBQYXRyaWNlIENob3RhcmTigJlzIFJldmlld2VkLWJ5Cj4gCj4gIGFy
Y2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgOCArKysrLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gaW5kZXggZWQzOTljMDBkMS4u
NzMyMzMyNWU2MCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3Nl
eS1zb20uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5k
dHNpCj4gQEAgLTI2NCwxNCArMjY0LDE0IEBACj4gIAo+ICAmc2RtbWMyIHsKPiAgCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCIsICJvcGVuZHJhaW4iLCAic2xlZXAiOwo+IC0JcGluY3RybC0wID0g
PCZzZG1tYzJfYjRfcGluc19hPjsKPiAtCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3BpbnNf
YT47Cj4gLQlwaW5jdHJsLTIgPSA8JnNkbW1jMl9iNF9zbGVlcF9waW5zX2E+Owo+ICsJcGluY3Ry
bC0wID0gPCZzZG1tYzJfYjRfcGluc19hICZzZG1tYzJfZDQ3X3BpbnNfZD47Cj4gKwlwaW5jdHJs
LTEgPSA8JnNkbW1jMl9iNF9vZF9waW5zX2EgJnNkbW1jMl9kNDdfcGluc19kPjsKPiArCXBpbmN0
cmwtMiA9IDwmc2RtbWMyX2I0X3NsZWVwX3BpbnNfYSAmc2RtbWMyX2Q0N19zbGVlcF9waW5zX2Q+
Owo+ICAJbm9uLXJlbW92YWJsZTsKPiAgCW5vLXNkOwo+ICAJbm8tc2RpbzsKPiAgCXN0LG5lZy1l
ZGdlOwo+IC0JYnVzLXdpZHRoID0gPDQ+Owo+ICsJYnVzLXdpZHRoID0gPDg+Owo+ICAJdm1tYy1z
dXBwbHkgPSA8JnYzdjM+Owo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+IApBcHBsaWVkIG9u
IHUtYm9vdC1zdG0zMi9uZXh0CgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
